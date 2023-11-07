
# Creates the default parameter group.
resource "aws_elasticache_parameter_group" "elasticache_parameters" {
  name   = "${var.cluster_name}-params"

  family = var.parameter_group_family

  dynamic "parameter" {
    for_each = var.parameter_group_overrides
    content {
      name  = parameter.key
      value = parameter.value
    }
  }
}