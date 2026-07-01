output "cluster_arn" {
  description = "ElastiCache cluster ARN."
  value       = module.elasticache.cluster_arn
}

output "cluster_address" {
  description = "DNS name of the Memcached cluster."
  value       = module.elasticache.cluster_address
}

output "configuration_endpoint" {
  description = "Configuration endpoint for the Memcached cluster."
  value       = module.elasticache.cluster_configuration_endpoint
}

output "subnet_group_name" {
  description = "ElastiCache subnet group name."
  value       = module.elasticache.subnet_group_name
}

output "security_group_id" {
  description = "Security group ID created by the ElastiCache module, if any."
  value       = try(module.elasticache.security_group_id, null)
}

output "parameter_group_id" {
  description = "ElastiCache parameter group ID."
  value       = try(module.elasticache.parameter_group_id, null)
}

output "parameter_group_arn" {
  description = "ElastiCache parameter group ARN."
  value       = try(module.elasticache.parameter_group_arn, null)
}