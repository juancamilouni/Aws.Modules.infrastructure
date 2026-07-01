module "elasticache" {
  source  = "terraform-aws-modules/elasticache/aws"
  version = "1.11.0"

  cluster_id = var.cluster_id

  create_cluster           = true
  create_replication_group = false

  engine         = "memcached"
  engine_version = var.engine_version
  node_type      = var.node_type

  num_cache_nodes = var.num_cache_nodes
  az_mode         = var.az_mode

  maintenance_window = var.maintenance_window
  apply_immediately  = var.apply_immediately

  create_security_group = false
  security_group_ids    = var.security_group_ids

  subnet_ids = var.subnet_ids

  create_parameter_group = var.create_parameter_group
  parameter_group_family = var.parameter_group_family
  parameters             = var.parameters

  tags = var.tags
}