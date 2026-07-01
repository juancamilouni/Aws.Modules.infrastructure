variable "name" {
  type        = string
  description = "Name used for CloudFront related resources."
}

variable "aliases" {
  type        = list(string)
  description = "Alternate domain names for the CloudFront distribution."
}

variable "comment" {
  type        = string
  description = "Comment for the CloudFront distribution."
}

variable "enabled" {
  type        = bool
  description = "Whether the CloudFront distribution is enabled."
  default     = true
}

variable "is_ipv6_enabled" {
  type        = bool
  description = "Whether IPv6 is enabled."
  default     = true
}

variable "price_class" {
  type        = string
  description = "CloudFront price class."
  default     = "PriceClass_100"
}

variable "http_version" {
  type        = string
  description = "CloudFront HTTP version."
  default     = "http2"
}

variable "retain_on_delete" {
  type        = bool
  description = "Whether the distribution should be retained instead of deleted."
  default     = false
}

variable "wait_for_deployment" {
  type        = bool
  description = "Whether Terraform should wait for CloudFront deployment."
  default     = false
}

variable "alb_domain_name" {
  type        = string
  description = "ALB DNS name used as CloudFront dynamic origin."
}

variable "certificate_arn" {
  type        = string
  description = "ACM certificate ARN for CloudFront. Must be in us-east-1."
}

variable "minimum_protocol_version" {
  type        = string
  description = "Minimum TLS protocol version."
  default     = "TLSv1.2_2021"
}

variable "enable_s3_static_assets" {
  type        = bool
  description = "Whether to enable S3 as static assets origin."
  default     = true
}

variable "s3_bucket_id" {
  type        = string
  description = "S3 bucket ID for static assets."
  default     = null
}

variable "s3_bucket_arn" {
  type        = string
  description = "S3 bucket ARN for static assets."
  default     = null
}

variable "s3_bucket_regional_domain_name" {
  type        = string
  description = "S3 bucket regional domain name for CloudFront origin."
  default     = null
}

variable "static_asset_path_patterns" {
  type        = list(string)
  description = "Path patterns routed to S3 static assets origin."
  default = [
    "/wp-content/*",
    "/wp-includes/*"
  ]
}

variable "cache_disabled_policy_name" {
  type        = string
  description = "Managed cache policy for dynamic WordPress traffic."
  default     = "Managed-CachingDisabled"
}

variable "cache_optimized_policy_name" {
  type        = string
  description = "Managed cache policy for static assets."
  default     = "Managed-CachingOptimized"
}

variable "origin_request_policy_name" {
  type        = string
  description = "Managed origin request policy for ALB origin."
  default     = "Managed-AllViewer"
}

variable "tags" {
  type        = map(string)
  description = "Common resource tags."
  default     = {}
}