variable "name" {
  type        = string
  description = "Name of the Application Load Balancer."
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the ALB will be created."
}

variable "subnet_ids" {
  type        = list(string)
  description = "Public subnet IDs for the ALB. ALB requires at least two subnets in different AZs."
}

variable "security_group_ids" {
  type        = list(string)
  description = "Existing security group IDs attached to the ALB."
}

variable "internal" {
  type        = bool
  description = "Whether the ALB is internal."
  default     = false
}

variable "certificate_arn" {
  type        = string
  description = "Existing ACM certificate ARN for the HTTPS listener."
}

variable "enable_deletion_protection" {
  type        = bool
  description = "Whether deletion protection is enabled for the ALB."
  default     = false
}

variable "drop_invalid_header_fields" {
  type        = bool
  description = "Whether invalid HTTP header fields are dropped by the ALB."
  default     = true
}

variable "access_logs" {
  type        = any
  description = "Access logs configuration for the ALB."
  default     = null
}

variable "target_group_name_prefix" {
  type        = string
  description = "Name prefix for the WordPress target group. Maximum 6 characters."
  default     = "wp-"
}

variable "target_group_port" {
  type        = number
  description = "Port where WordPress instances receive traffic."
  default     = 80
}

variable "deregistration_delay" {
  type        = number
  description = "Target deregistration delay in seconds."
  default     = 30
}

variable "load_balancing_cross_zone_enabled" {
  type        = bool
  description = "Whether cross-zone load balancing is enabled."
  default     = true
}

variable "health_check_path" {
  type        = string
  description = "Health check path for WordPress."
  default     = "/"
}

variable "health_check_interval" {
  type        = number
  description = "Approximate amount of time between health checks."
  default     = 30
}

variable "health_check_timeout" {
  type        = number
  description = "Health check timeout in seconds."
  default     = 5
}

variable "healthy_threshold" {
  type        = number
  description = "Number of successful health checks before target is considered healthy."
  default     = 3
}

variable "unhealthy_threshold" {
  type        = number
  description = "Number of failed health checks before target is considered unhealthy."
  default     = 3
}

variable "health_check_matcher" {
  type        = string
  description = "HTTP status code matcher for the health check."
  default     = "200-399"
}

variable "tags" {
  type        = map(string)
  description = "Common resource tags."
  default     = {}
}