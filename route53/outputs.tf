output "route53_record_fqdn" {
  description = "FQDN of the Route53 records."
  value       = module.records.route53_record_fqdn
}

output "route53_record_name" {
  description = "Names of the Route53 records."
  value       = module.records.route53_record_name
}