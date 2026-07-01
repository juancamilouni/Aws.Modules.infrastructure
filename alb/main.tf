module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "10.5.0"

  name = var.name

  load_balancer_type = "application"
  internal           = var.internal

  vpc_id  = var.vpc_id
  subnets = var.subnet_ids

  create_security_group = false
  security_groups       = var.security_group_ids

  enable_deletion_protection = var.enable_deletion_protection
  drop_invalid_header_fields = var.drop_invalid_header_fields

  access_logs = var.access_logs

  listeners = {
    http_redirect = {
      port     = 80
      protocol = "HTTP"

      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }

    https = {
      port            = 443
      protocol        = "HTTPS"
      certificate_arn = var.certificate_arn

      forward = {
        target_group_key = "wordpress"
      }
    }
  }

  target_groups = {
    wordpress = {
      name_prefix                       = var.target_group_name_prefix
      protocol                          = "HTTP"
      port                              = var.target_group_port
      target_type                       = "instance"
      deregistration_delay              = var.deregistration_delay
      load_balancing_cross_zone_enabled = var.load_balancing_cross_zone_enabled

      health_check = {
        enabled             = true
        interval            = var.health_check_interval
        path                = var.health_check_path
        port                = "traffic-port"
        healthy_threshold   = var.healthy_threshold
        unhealthy_threshold = var.unhealthy_threshold
        timeout             = var.health_check_timeout
        protocol            = "HTTP"
        matcher             = var.health_check_matcher
      }

      create_attachment = false
    }
  }

  tags = var.tags
}