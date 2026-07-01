output "vpc_id" {
  description = "ID of the VPC."
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC."
  value       = module.vpc.vpc_cidr_block
}

output "public_subnet_ids" {
  description = "IDs of the public subnets."
  value       = module.vpc.public_subnets
}

output "private_subnet_ids" {
  description = "IDs of the private application subnets."
  value       = module.vpc.private_subnets
}

output "database_subnet_ids" {
  description = "IDs of the database subnets."
  value       = module.vpc.database_subnets
}

output "database_subnet_group_name" {
  description = "Name of the database subnet group."
  value       = module.vpc.database_subnet_group_name
}

output "nat_gateway_ids" {
  description = "IDs of the NAT Gateways."
  value       = module.vpc.natgw_ids
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway."
  value       = module.vpc.igw_id
}

output "public_route_table_ids" {
  description = "IDs of the public route tables."
  value       = module.vpc.public_route_table_ids
}

output "private_route_table_ids" {
  description = "IDs of the private route tables."
  value       = module.vpc.private_route_table_ids
}