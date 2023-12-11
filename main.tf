resource "aws_elasticache_cluster" "elasticache" {
  count = var.num_cache_nodes == 1 || var.engine == "memcached" ? 1 : 0
  cluster_id           = var.cluster_name
  engine               = var.engine
  engine_version       = var.engine_version
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = aws_elasticache_parameter_group.elasticache_parameters.name
  port                 = var.engine == "redis" ? 6379 : 11211
  az_mode              = var.multi_az_mode == true && var.engine == "memcached" ? "cross-az" : "single-az"
  maintenance_window   = "wed:01:30-wed:02:30"
  subnet_group_name = aws_elasticache_subnet_group.elasticache_subnet_group.name
  security_group_ids   = var.security_group_ids
  tags = merge(var.additional_tags,
            {Type = var.engine})
}

resource "aws_elasticache_replication_group" "redis_replication_cluster" {
  count = var.num_cache_nodes != 1 && var.engine == "redis" ? 1 : 0
  automatic_failover_enabled  = true
  preferred_cache_cluster_azs = var.preferred_cache_cluster_azs
  replication_group_id        = var.cluster_name
  description                 = "replication group for redis cluster"
  node_type                   = var.node_type
  engine                      = "redis"
  engine_version              = var.engine_version
  num_cache_clusters          = var.num_cache_nodes
  parameter_group_name        = aws_elasticache_parameter_group.elasticache_parameters.name
  port                        = 6379
  multi_az_enabled            = var.multi_az_mode
  security_group_ids          = var.security_group_ids
  subnet_group_name           = aws_elasticache_subnet_group.elasticache_subnet_group.name
  tags = merge(var.additional_tags,
          {Type = var.engine})
}

resource "aws_elasticache_subnet_group" "elasticache_subnet_group" {
  name       = "${var.cluster_name}-elasticache-subnet"
  subnet_ids = var.subnet_ids
}
