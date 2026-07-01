variable "name" {
  type        = string
  description = "Name of the Auto Scaling Group."
}

variable "instance_name" {
  type        = string
  description = "Name tag for EC2 instances launched by the ASG."
}

variable "ami_id" {
  type        = string
  description = "Optional AMI ID. If null, latest Amazon Linux 2023 AMI is used."
  default     = null
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type."
  default     = "t3.micro"
}

variable "min_size" {
  type        = number
  description = "Minimum number of instances in the ASG."
  default     = 1
}

variable "max_size" {
  type        = number
  description = "Maximum number of instances in the ASG."
  default     = 1
}

variable "desired_capacity" {
  type        = number
  description = "Desired number of instances in the ASG."
  default     = 1
}

variable "subnet_ids" {
  type        = list(string)
  description = "Private subnet IDs where EC2 instances will run."
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs attached to EC2 instances."
}

variable "target_group_arns" {
  type        = list(string)
  description = "ALB target group ARNs attached to the ASG."
}

variable "efs_dns" {
  type        = string
  description = "EFS DNS name mounted by the EC2 bootstrap script."
}

variable "efs_mount_point" {
  type        = string
  description = "Mount point for EFS inside the EC2 instance."
  default     = "/mnt/efs"
}

variable "additional_policy_arns" {
  type        = list(string)
  description = "Additional IAM managed policy ARNs attached to the EC2 role."
  default     = []
}

variable "secrets_manager_secret_arns" {
  type        = list(string)
  description = "Secrets Manager secret ARNs that EC2 instances are allowed to read."
  default     = []
}

variable "enable_detailed_monitoring" {
  type        = bool
  description = "Whether to enable detailed EC2 monitoring."
  default     = true
}

variable "root_device_name" {
  type        = string
  description = "Root block device name."
  default     = "/dev/xvda"
}

variable "root_volume_size" {
  type        = number
  description = "Root volume size in GB."
  default     = 20
}

variable "root_volume_type" {
  type        = string
  description = "Root volume type."
  default     = "gp3"
}

variable "root_volume_encrypted" {
  type        = bool
  description = "Whether the root EBS volume is encrypted."
  default     = true
}

variable "root_volume_kms_key_id" {
  type        = string
  description = "KMS key ID or ARN for root EBS volume encryption."
  default     = null
}

variable "health_check_grace_period" {
  type        = number
  description = "ASG health check grace period in seconds."
  default     = 300
}

variable "protect_from_scale_in" {
  type        = bool
  description = "Whether instances are protected from scale in."
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Common resource tags."
  default     = {}
}