output "elasticache_dns_address" {
    value = var.num_cache_nodes == 1 || var.engine == "memcached" ? aws_elasticache_cluster.elasticache.0.cache_nodes[0].address : aws_elasticache_replication_group.redis_replication_cluster.0.primary_endpoint_address
}

output "memcached_config_endpoint" {
    value = aws_elasticache_cluster.elasticache.*.configuration_endpoint
}

output "elasticache_arn" {
    value = var.num_cache_nodes == 1 || var.engine == "memcached" ? aws_elasticache_cluster.elasticache.0.arn : aws_elasticache_replication_group.redis_replication_cluster.0.arn
}

output "redis_primary_endpoint" {
    value = aws_elasticache_replication_group.redis_replication_cluster.*.primary_endpoint_address
}

output "redis_reader_endpoint" {
    value = aws_elasticache_replication_group.redis_replication_cluster.*.reader_endpoint_address
}
