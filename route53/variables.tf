variable "zone_name" {
  type        = string
  description = "Existing Route53 hosted zone name, for example example.com."
}

variable "private_zone" {
  type        = bool
  description = "Whether the hosted zone is private."
  default     = false
}

variable "records" {
  type = list(object({
    name                   = string
    type                   = string
    alias_name             = string
    alias_zone_id          = string
    evaluate_target_health = optional(bool, false)
  }))

  description = "DNS alias records to create in the existing Route53 hosted zone."
}