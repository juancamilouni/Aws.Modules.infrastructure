data "aws_ec2_managed_prefix_list" "cloudfront" {
  count = var.restrict_alb_to_cloudfront ? 1 : 0
  name  = "com.amazonaws.global.cloudfront.origin-facing"
}

resource "aws_security_group" "alb" {
  name        = var.alb_security_group_name
  description = "Security group for public Application Load Balancer."
  vpc_id      = var.vpc_id

  tags = merge(var.tags, {
    Name = var.alb_security_group_name
    Tier = "public"
  })
}

resource "aws_security_group" "wordpress" {
  name        = var.wordpress_security_group_name
  description = "Security group for WordPress application instances."
  vpc_id      = var.vpc_id

  tags = merge(var.tags, {
    Name = var.wordpress_security_group_name
    Tier = "app"
  })
}

resource "aws_security_group" "rds" {
  name        = var.rds_security_group_name
  description = "Security group for database."
  vpc_id      = var.vpc_id

  tags = merge(var.tags, {
    Name = var.rds_security_group_name
    Tier = "data"
  })
}

resource "aws_security_group" "efs" {
  name        = var.efs_security_group_name
  description = "Security group for EFS."
  vpc_id      = var.vpc_id

  tags = merge(var.tags, {
    Name = var.efs_security_group_name
    Tier = "data"
  })
}

resource "aws_security_group" "elasticache" {
  name        = var.elasticache_security_group_name
  description = "Security group for ElastiCache."
  vpc_id      = var.vpc_id

  tags = merge(var.tags, {
    Name = var.elasticache_security_group_name
    Tier = "data"
  })
}

resource "aws_vpc_security_group_ingress_rule" "alb_http" {
  count = var.enable_http ? 1 : 0

  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = var.allowed_http_cidr
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"

  tags = merge(var.tags, {
    Name = "allow-http-to-alb"
  })
}

resource "aws_vpc_security_group_ingress_rule" "alb_https_from_cloudfront" {
  count = var.restrict_alb_to_cloudfront ? 1 : 0

  security_group_id = aws_security_group.alb.id
  prefix_list_id    = data.aws_ec2_managed_prefix_list.cloudfront[0].id

  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"

  tags = merge(var.tags, {
    Name = "allow-https-from-cloudfront-to-alb"
  })
}

resource "aws_vpc_security_group_ingress_rule" "alb_https_from_cidr" {
  count = var.restrict_alb_to_cloudfront ? 0 : 1

  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = var.allowed_https_cidr

  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"

  tags = merge(var.tags, {
    Name = "allow-https-to-alb"
  })
}

resource "aws_vpc_security_group_ingress_rule" "wordpress_http_from_alb" {
  security_group_id            = aws_security_group.wordpress.id
  referenced_security_group_id = aws_security_group.alb.id

  from_port   = var.wordpress_http_port
  to_port     = var.wordpress_http_port
  ip_protocol = "tcp"

  tags = merge(var.tags, {
    Name = "allow-http-from-alb-to-wordpress"
  })
}

resource "aws_vpc_security_group_ingress_rule" "rds_from_wordpress" {
  security_group_id            = aws_security_group.rds.id
  referenced_security_group_id = aws_security_group.wordpress.id

  from_port   = var.database_port
  to_port     = var.database_port
  ip_protocol = "tcp"

  tags = merge(var.tags, {
    Name = "allow-wordpress-to-rds"
  })
}

resource "aws_vpc_security_group_ingress_rule" "efs_from_wordpress" {
  security_group_id            = aws_security_group.efs.id
  referenced_security_group_id = aws_security_group.wordpress.id

  from_port   = 2049
  to_port     = 2049
  ip_protocol = "tcp"

  tags = merge(var.tags, {
    Name = "allow-wordpress-to-efs"
  })
}

resource "aws_vpc_security_group_ingress_rule" "elasticache_from_wordpress" {
  security_group_id            = aws_security_group.elasticache.id
  referenced_security_group_id = aws_security_group.wordpress.id

  from_port   = var.elasticache_port
  to_port     = var.elasticache_port
  ip_protocol = "tcp"

  tags = merge(var.tags, {
    Name = "allow-wordpress-to-elasticache"
  })
}

resource "aws_vpc_security_group_egress_rule" "alb_all" {
  security_group_id = aws_security_group.alb.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = merge(var.tags, {
    Name = "allow-all-egress-from-alb"
  })
}

resource "aws_vpc_security_group_egress_rule" "wordpress_all" {
  security_group_id = aws_security_group.wordpress.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = merge(var.tags, {
    Name = "allow-all-egress-from-wordpress"
  })
}

resource "aws_vpc_security_group_egress_rule" "rds_all" {
  security_group_id = aws_security_group.rds.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = merge(var.tags, {
    Name = "allow-all-egress-from-rds"
  })
}

resource "aws_vpc_security_group_egress_rule" "efs_all" {
  security_group_id = aws_security_group.efs.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = merge(var.tags, {
    Name = "allow-all-egress-from-efs"
  })
}

resource "aws_vpc_security_group_egress_rule" "elasticache_all" {
  security_group_id = aws_security_group.elasticache.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = merge(var.tags, {
    Name = "allow-all-egress-from-elasticache"
  })
}