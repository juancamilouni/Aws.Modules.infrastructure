variable "vpc_name" {
  type        = string
  description = "Name of the VPC."
}

variable "cidr_block" {
  type        = string
  description = "CIDR block for the VPC."
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zones used by the VPC."
}

variable "public_subnets" {
  type        = list(string)
  description = "CIDR blocks for public subnets."
}

variable "private_subnets" {
  type        = list(string)
  description = "CIDR blocks for private application subnets."
}

variable "database_subnets" {
  type        = list(string)
  description = "CIDR blocks for private database subnets."
}

variable "enable_nat_gateway" {
  type        = bool
  default     = true
  description = "Whether to create NAT Gateway."
}

variable "single_nat_gateway" {
  type        = bool
  default     = true
  description = "Whether to create a single shared NAT Gateway."
}

variable "enable_dns_hostnames" {
  type        = bool
  default     = true
  description = "Whether to enable DNS hostnames."
}

variable "enable_dns_support" {
  type        = bool
  default     = true
  description = "Whether to enable DNS support."
}

variable "map_public_ip_on_launch" {
  type        = bool
  default     = true
  description = "Whether instances launched in public subnets receive public IPs."
}

variable "create_database_subnet_group" {
  type        = bool
  default     = true
  description = "Whether to create a database subnet group."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Common resource tags."
}