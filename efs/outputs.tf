output "id" {
  description = "ID of the EFS file system."
  value       = module.efs.id
}

output "arn" {
  description = "ARN of the EFS file system."
  value       = module.efs.arn
}

output "dns_name" {
  description = "DNS name of the EFS file system."
  value       = module.efs.dns_name
}

output "mount_targets" {
  description = "EFS mount target attributes."
  value       = module.efs.mount_targets
}

output "access_points" {
  description = "EFS access point attributes."
  value       = module.efs.access_points
}