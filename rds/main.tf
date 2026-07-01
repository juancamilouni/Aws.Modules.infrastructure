module "rds_aurora" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "9.16.1"

  name           = var.name
  engine         = var.engine
  engine_version = var.engine_version
  engine_mode    = var.engine_mode

  database_name   = var.database_name
  master_username = var.master_username

  manage_master_user_password = var.manage_master_user_password

  instance_class = var.instance_class
  instances      = var.instances

  vpc_id               = var.vpc_id
  db_subnet_group_name = var.db_subnet_group_name

  create_security_group  = false
  vpc_security_group_ids = var.vpc_security_group_ids

  storage_encrypted = var.storage_encrypted
  kms_key_id        = var.kms_key_id

  apply_immediately   = var.apply_immediately
  skip_final_snapshot = var.skip_final_snapshot
  deletion_protection = var.deletion_protection

  backup_retention_period      = var.backup_retention_period
  preferred_backup_window      = var.preferred_backup_window
  preferred_maintenance_window = var.preferred_maintenance_window
  delete_automated_backups     = var.delete_automated_backups

  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports

  create_cloudwatch_log_group            = var.create_cloudwatch_log_group
  cloudwatch_log_group_retention_in_days = var.cloudwatch_log_group_retention_in_days

  create_db_cluster_parameter_group      = var.create_db_cluster_parameter_group
  db_cluster_parameter_group_name        = var.db_cluster_parameter_group_name
  db_cluster_parameter_group_family      = var.db_cluster_parameter_group_family
  db_cluster_parameter_group_description = var.db_cluster_parameter_group_description
  db_cluster_parameter_group_parameters  = var.db_cluster_parameter_group_parameters

  create_db_parameter_group      = var.create_db_parameter_group
  db_parameter_group_name        = var.db_parameter_group_name
  db_parameter_group_family      = var.db_parameter_group_family
  db_parameter_group_description = var.db_parameter_group_description
  db_parameter_group_parameters  = var.db_parameter_group_parameters

  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_retention_period = var.performance_insights_retention_period

  monitoring_interval = var.monitoring_interval

  cluster_timeouts = var.cluster_timeouts

  tags = var.tags
}