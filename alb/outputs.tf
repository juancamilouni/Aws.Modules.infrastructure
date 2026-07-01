output "id" {
  description = "ID of the ALB."
  value       = module.alb.id
}

output "arn" {
  description = "ARN of the ALB."
  value       = module.alb.arn
}

output "arn_suffix" {
  description = "ARN suffix of the ALB."
  value       = module.alb.arn_suffix
}

output "dns_name" {
  description = "DNS name of the ALB."
  value       = module.alb.dns_name
}

output "zone_id" {
  description = "Canonical hosted zone ID of the ALB."
  value       = module.alb.zone_id
}

output "target_groups" {
  description = "Map of target groups created by the ALB module."
  value       = module.alb.target_groups
}

output "wordpress_target_group_arn" {
  description = "ARN of the WordPress target group."
  value       = module.alb.target_groups["wordpress"].arn
}

output "listeners" {
  description = "Map of listeners created by the ALB module."
  value       = module.alb.listeners
}