variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket."
}

variable "force_destroy" {
  type        = bool
  description = "Whether to force destroy the bucket even if it contains objects."
  default     = false
}

variable "enable_versioning" {
  type        = bool
  description = "Whether to enable bucket versioning."
  default     = true
}

variable "kms_key_arn" {
  type        = string
  description = "KMS key ARN used for bucket encryption. If null, AES256 is used."
  default     = null
}

variable "object_ownership" {
  type        = string
  description = "Object ownership mode for the bucket."
  default     = "BucketOwnerEnforced"

  validation {
    condition = contains([
      "BucketOwnerEnforced",
      "BucketOwnerPreferred",
      "ObjectWriter"
    ], var.object_ownership)

    error_message = "object_ownership must be BucketOwnerEnforced, BucketOwnerPreferred, or ObjectWriter."
  }
}

variable "tags" {
  type        = map(string)
  description = "Common resource tags."
  default     = {}
}