module "efs" {
  source  = "terraform-aws-modules/efs/aws"
  version = "2.2.0"

  name           = var.name
  creation_token = var.creation_token

  encrypted        = var.encrypted
  kms_key_arn      = var.kms_key_arn
  performance_mode = var.performance_mode
  throughput_mode  = var.throughput_mode

  lifecycle_policy = var.lifecycle_policy

  mount_targets = var.mount_targets

  security_group_vpc_id        = var.security_group_vpc_id
  security_group_ingress_rules = var.security_group_ingress_rules

  enable_backup_policy = var.enable_backup_policy

  create_replication_configuration      = var.create_replication_configuration
  replication_configuration_destination = var.replication_configuration_destination

  tags = var.tags
}