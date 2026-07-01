variable "name" {
  type        = string
  description = "Name of the EFS file system."
}

variable "creation_token" {
  type        = string
  description = "Unique creation token for the EFS file system."
}

variable "encrypted" {
  type        = bool
  description = "Whether to enable encryption at rest."
  default     = true
}

variable "kms_key_arn" {
  type        = string
  description = "KMS key ARN used to encrypt the EFS file system."
  default     = null
}

variable "performance_mode" {
  type        = string
  description = "EFS performance mode."
  default     = "generalPurpose"
}

variable "throughput_mode" {
  type        = string
  description = "EFS throughput mode."
  default     = "bursting"
}

variable "lifecycle_policy" {
  type        = any
  description = "EFS lifecycle policy."
  default = {
    transition_to_ia = "AFTER_30_DAYS"
  }
}

variable "mount_targets" {
  type        = map(any)
  description = "Map of EFS mount targets."
}

variable "security_group_vpc_id" {
  type        = string
  description = "VPC ID where the EFS security group will be created."
}

variable "security_group_ingress_rules" {
  type        = any
  description = "Ingress rules for the EFS security group."
  default     = {}
}

variable "enable_backup_policy" {
  type        = bool
  description = "Whether to enable automatic backups for EFS."
  default     = false
}

variable "create_replication_configuration" {
  type        = bool
  description = "Whether to create EFS replication configuration."
  default     = false
}

variable "replication_configuration_destination" {
  type        = any
  description = "Replication configuration destination."
  default     = {}
}

variable "tags" {
  type        = map(string)
  description = "Common resource tags."
  default     = {}
}