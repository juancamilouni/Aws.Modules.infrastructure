variable "description" {
  type        = string
  description = "Description of the KMS key."
}

variable "aliases" {
  type        = list(string)
  description = "List of aliases to create for the KMS key. Do not include alias/ prefix."
  default     = []
}

variable "enable_default_policy" {
  type        = bool
  description = "Whether to enable the default KMS key policy."
  default     = true
}

variable "key_owners" {
  type        = list(string)
  description = "List of IAM ARNs that have full ownership of the KMS key."
  default     = []
}

variable "key_administrators" {
  type        = list(string)
  description = "List of IAM ARNs that can administer the KMS key."
  default     = []
}

variable "key_users" {
  type        = list(string)
  description = "List of IAM ARNs that can use the KMS key."
  default     = []
}

variable "key_service_users" {
  type        = list(string)
  description = "List of IAM ARNs for AWS services allowed to use the KMS key."
  default     = []
}

variable "deletion_window_in_days" {
  type        = number
  description = "Waiting period before KMS key deletion."
  default     = 30
}

variable "enable_key_rotation" {
  type        = bool
  description = "Whether to enable automatic KMS key rotation."
  default     = true
}

variable "multi_region" {
  type        = bool
  description = "Whether to create a multi-region KMS key."
  default     = false
}

variable "key_statements" {
  type        = any
  description = "Additional key policy statements."
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Common resource tags."
  default     = {}
}