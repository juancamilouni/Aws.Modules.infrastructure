output "cluster_id" {
  description = "Aurora cluster ID."
  value       = module.rds_aurora.cluster_id
}

output "cluster_arn" {
  description = "Aurora cluster ARN."
  value       = module.rds_aurora.cluster_arn
}

output "cluster_resource_id" {
  description = "Aurora cluster resource ID."
  value       = module.rds_aurora.cluster_resource_id
}

output "cluster_endpoint" {
  description = "Aurora writer endpoint."
  value       = module.rds_aurora.cluster_endpoint
}

output "cluster_reader_endpoint" {
  description = "Aurora reader endpoint."
  value       = module.rds_aurora.cluster_reader_endpoint
}

output "cluster_port" {
  description = "Aurora cluster port."
  value       = module.rds_aurora.cluster_port
}

output "cluster_database_name" {
  description = "Aurora database name."
  value       = module.rds_aurora.cluster_database_name
}

output "cluster_master_username" {
  description = "Aurora master username."
  value       = module.rds_aurora.cluster_master_username
  sensitive   = true
}

output "cluster_master_user_secret" {
  description = "Secret Manager secret metadata for the master user password."
  value       = module.rds_aurora.cluster_master_user_secret
  sensitive   = true
}

output "cluster_instances" {
  description = "Map of Aurora cluster instances."
  value       = module.rds_aurora.cluster_instances
}