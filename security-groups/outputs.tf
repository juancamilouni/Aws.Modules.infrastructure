output "alb_security_group_id" {
  description = "ID of the ALB security group."
  value       = aws_security_group.alb.id
}

output "wordpress_security_group_id" {
  description = "ID of the WordPress security group."
  value       = aws_security_group.wordpress.id
}

output "rds_security_group_id" {
  description = "ID of the RDS security group."
  value       = aws_security_group.rds.id
}

output "efs_security_group_id" {
  description = "ID of the EFS security group."
  value       = aws_security_group.efs.id
}

output "elasticache_security_group_id" {
  description = "ID of the ElastiCache security group."
  value       = aws_security_group.elasticache.id
}

output "security_group_ids" {
  description = "Map of all security group IDs."
  value = {
    alb         = aws_security_group.alb.id
    wordpress   = aws_security_group.wordpress.id
    rds         = aws_security_group.rds.id
    efs         = aws_security_group.efs.id
    elasticache = aws_security_group.elasticache.id
  }
}