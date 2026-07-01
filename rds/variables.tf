variable "name" {
  type        = string
  description = "Name of the Aurora cluster."
}

variable "engine" {
  type        = string
  description = "Aurora database engine."
  default     = "aurora-mysql"
}

variable "engine_version" {
  type        = string
  description = "Aurora MySQL engine version."
  default     = "8.0.mysql_aurora.3.08.0"
}

variable "engine_mode" {
  type        = string
  description = "Aurora engine mode."
  default     = "provisioned"
}

variable "database_name" {
  type        = string
  description = "Initial database name."
}

variable "master_username" {
  type        = string
  description = "Master database username."
  default     = "wordpress_admin"
}

variable "manage_master_user_password" {
  type        = bool
  description = "Whether RDS manages the master user password in Secrets Manager."
  default     = true
}

variable "instance_class" {
  type        = string
  description = "Aurora instance class."
  default     = "db.t4g.medium"
}

variable "instances" {
  type        = any
  description = "Map of Aurora cluster instances."
  default = {
    1 = {}
  }
}

variable "vpc_id" {
  type        = string
  description = "VPC ID."
}

variable "db_subnet_group_name" {
  type        = string
  description = "Existing DB subnet group name."
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "Security group IDs attached to the Aurora cluster."
}

variable "storage_encrypted" {
  type        = bool
  description = "Whether to enable storage encryption."
  default     = true
}

variable "kms_key_id" {
  type        = string
  description = "KMS key ARN or ID used for Aurora encryption."
  default     = null
}

variable "apply_immediately" {
  type        = bool
  description = "Whether changes are applied immediately."
  default     = true
}

variable "skip_final_snapshot" {
  type        = bool
  description = "Whether to skip final snapshot on deletion."
  default     = false
}

variable "deletion_protection" {
  type        = bool
  description = "Whether deletion protection is enabled."
  default     = true
}

variable "backup_retention_period" {
  type        = number
  description = "Backup retention period in days."
  default     = 15
}

variable "preferred_backup_window" {
  type        = string
  description = "Preferred backup window."
  default     = "03:00-04:00"
}

variable "preferred_maintenance_window" {
  type        = string
  description = "Preferred maintenance window."
  default     = "sun:04:00-sun:05:00"
}

variable "delete_automated_backups" {
  type        = bool
  description = "Whether to delete automated backups when the cluster is deleted."
  default     = false
}

variable "enabled_cloudwatch_logs_exports" {
  type        = list(string)
  description = "List of log types to export to CloudWatch."
  default     = ["audit", "error", "general", "slowquery"]
}

variable "create_cloudwatch_log_group" {
  type        = bool
  description = "Whether to create CloudWatch log groups for exported logs."
  default     = true
}

variable "cloudwatch_log_group_retention_in_days" {
  type        = number
  description = "CloudWatch log retention in days."
  default     = 30
}

variable "create_db_cluster_parameter_group" {
  type        = bool
  description = "Whether to create a DB cluster parameter group."
  default     = true
}

variable "db_cluster_parameter_group_name" {
  type        = string
  description = "Name of the DB cluster parameter group."
  default     = null
}

variable "db_cluster_parameter_group_family" {
  type        = string
  description = "Family of the DB cluster parameter group."
  default     = "aurora-mysql8.0"
}

variable "db_cluster_parameter_group_description" {
  type        = string
  description = "Description of the DB cluster parameter group."
  default     = null
}

variable "db_cluster_parameter_group_parameters" {
  type        = list(map(string))
  description = "DB cluster parameter group parameters."
  default = [
    {
      name         = "connect_timeout"
      value        = "120"
      apply_method = "immediate"
    }
  ]
}

variable "create_db_parameter_group" {
  type        = bool
  description = "Whether to create a DB parameter group."
  default     = true
}

variable "db_parameter_group_name" {
  type        = string
  description = "Name of the DB parameter group."
  default     = null
}

variable "db_parameter_group_family" {
  type        = string
  description = "Family of the DB parameter group."
  default     = "aurora-mysql8.0"
}

variable "db_parameter_group_description" {
  type        = string
  description = "Description of the DB parameter group."
  default     = null
}

variable "db_parameter_group_parameters" {
  type        = list(map(string))
  description = "DB parameter group parameters."
  default = [
    {
      name         = "connect_timeout"
      value        = "60"
      apply_method = "immediate"
    }
  ]
}

variable "performance_insights_enabled" {
  type        = bool
  description = "Whether to enable Performance Insights."
  default     = true
}

variable "performance_insights_retention_period" {
  type        = number
  description = "Performance Insights retention period."
  default     = 7
}

variable "monitoring_interval" {
  type        = number
  description = "Enhanced monitoring interval in seconds. Set 0 to disable."
  default     = 0
}

variable "cluster_timeouts" {
  type        = map(string)
  description = "Timeouts for cluster create, update, and delete."
  default = {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}

variable "tags" {
  type        = map(string)
  description = "Common resource tags."
  default     = {}
}