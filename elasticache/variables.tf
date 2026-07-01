variable "cluster_id" {
  type        = string
  description = "ElastiCache Memcached cluster ID."
}

variable "engine_version" {
  type        = string
  description = "Memcached engine version."
  default     = "1.6.17"
}

variable "node_type" {
  type        = string
  description = "ElastiCache node type."
  default     = "cache.t4g.micro"
}

variable "num_cache_nodes" {
  type        = number
  description = "Number of Memcached cache nodes."
  default     = 1
}

variable "az_mode" {
  type        = string
  description = "Memcached AZ mode."
  default     = "single-az"

  validation {
    condition     = contains(["single-az", "cross-az"], var.az_mode)
    error_message = "az_mode must be single-az or cross-az."
  }
}

variable "maintenance_window" {
  type        = string
  description = "Preferred maintenance window."
  default     = "sun:05:00-sun:09:00"
}

variable "apply_immediately" {
  type        = bool
  description = "Whether changes should be applied immediately."
  default     = true
}

variable "security_group_ids" {
  type        = list(string)
  description = "Existing security group IDs to associate with ElastiCache."
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for the ElastiCache subnet group."
}

variable "create_parameter_group" {
  type        = bool
  description = "Whether to create a parameter group."
  default     = true
}

variable "parameter_group_family" {
  type        = string
  description = "ElastiCache parameter group family."
  default     = "memcached1.6"
}

variable "parameters" {
  type = list(object({
    name  = string
    value = string
  }))

  description = "List of ElastiCache parameter group parameters."

  default = [
    {
      name  = "idle_timeout"
      value = "60"
    }
  ]
}

variable "tags" {
  type        = map(string)
  description = "Common resource tags."
  default     = {}
}