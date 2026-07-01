variable "vpc_id" {
  type        = string
  description = "ID of the VPC where security groups will be created."
}

variable "alb_security_group_name" {
  type        = string
  description = "Name of the ALB security group."
}

variable "wordpress_security_group_name" {
  type        = string
  description = "Name of the WordPress security group."
}

variable "rds_security_group_name" {
  type        = string
  description = "Name of the RDS security group."
}

variable "efs_security_group_name" {
  type        = string
  description = "Name of the EFS security group."
}

variable "elasticache_security_group_name" {
  type        = string
  description = "Name of the ElastiCache security group."
}

variable "enable_http" {
  type        = bool
  description = "Whether to allow HTTP traffic to the ALB."
  default     = true
}

variable "allowed_http_cidr" {
  type        = string
  description = "CIDR allowed to access the ALB over HTTP."
  default     = "0.0.0.0/0"
}

variable "restrict_alb_to_cloudfront" {
  type        = bool
  description = "Whether to allow HTTPS traffic to the ALB only from CloudFront origin-facing managed prefix list."
  default     = true
}

variable "allowed_https_cidr" {
  type        = string
  description = "CIDR allowed to access the ALB over HTTPS when restrict_alb_to_cloudfront is false."
  default     = "0.0.0.0/0"
}

variable "wordpress_http_port" {
  type        = number
  description = "HTTP port used by WordPress instances."
  default     = 80
}

variable "database_port" {
  type        = number
  description = "Database port."
  default     = 3306
}

variable "elasticache_port" {
  type        = number
  description = "ElastiCache Memcached port."
  default     = 11211
}

variable "tags" {
  type        = map(string)
  description = "Common resource tags."
  default     = {}
}