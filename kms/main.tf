module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "4.2.0"

  description = var.description

  aliases                 = var.aliases
  enable_default_policy   = var.enable_default_policy
  key_owners              = var.key_owners
  key_administrators      = var.key_administrators
  key_users               = var.key_users
  key_service_users       = var.key_service_users
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
  multi_region            = var.multi_region
  key_statements          = var.key_statements

  tags = var.tags
}