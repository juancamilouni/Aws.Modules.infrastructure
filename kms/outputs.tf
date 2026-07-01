output "key_id" {
  description = "The globally unique identifier for the KMS key."
  value       = module.kms.key_id
}

output "key_arn" {
  description = "The Amazon Resource Name ARN of the KMS key."
  value       = module.kms.key_arn
}

output "key_policy" {
  description = "The IAM resource policy set on the KMS key."
  value       = module.kms.key_policy
}

output "aliases" {
  description = "Map of aliases created and their attributes."
  value       = module.kms.aliases
}