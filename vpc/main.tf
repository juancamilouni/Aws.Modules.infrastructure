module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.6.1"

  name = var.vpc_name
  cidr = var.cidr_block

  azs              = var.availability_zones
  public_subnets   = var.public_subnets
  private_subnets  = var.private_subnets
  database_subnets = var.database_subnets

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  map_public_ip_on_launch = var.map_public_ip_on_launch

  create_database_subnet_group = var.create_database_subnet_group

  public_subnet_tags = merge(var.tags, {
    Tier = "public"
  })

  private_subnet_tags = merge(var.tags, {
    Tier = "app"
  })

  database_subnet_tags = merge(var.tags, {
    Tier = "data"
  })

  tags = var.tags
}