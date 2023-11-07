# Terraform AWS [Module Name] ![](https://img.shields.io/github/workflow/status/TechNative-B-V/terraform-aws-module-name/tflint.yaml?style=plastic)

<!-- SHIELDS -->

This module implements ...

[![](we-are-technative.png)](https://www.technative.nl)

## How does it work

### First use after you clone this repository or when .pre-commit-config.yaml is updated

Run `pre-commit install` to install any guardrails implemented using pre-commit.

See [pre-commit installation](https://pre-commit.com/#install) on how to install pre-commit.

...

## Usage

To use this module ...

```hcl
{
  some_conf = "might need explanation"
}
```

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >=4.8.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_cluster.elasticache](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster) | resource |
| [aws_elasticache_parameter_group.elasticache_parameters](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_parameter_group) | resource |
| [aws_elasticache_replication_group.redis_replication_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) | resource |
| [aws_elasticache_subnet_group.elasticache_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | Additional tags to be added to resources. | `map(string)` | `{}` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Cluster identifier. | `string` | n/a | yes |
| <a name="input_engine"></a> [engine](#input\_engine) | Choose between redis or memcached engine types | `string` | n/a | yes |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Version number of the cache engine to be used. If not set, defaults to the latest version. | `string` | n/a | yes |
| <a name="input_multi_az_mode"></a> [multi\_az\_mode](#input\_multi\_az\_mode) | Whether Redis nodes are created in a single AZ or created across multiple AZ. | `bool` | n/a | yes |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | The instance class used. | `string` | n/a | yes |
| <a name="input_num_cache_nodes"></a> [num\_cache\_nodes](#input\_num\_cache\_nodes) | The initial number of cache nodes that the cache cluster will have. | `number` | `1` | no |
| <a name="input_parameter_group_family"></a> [parameter\_group\_family](#input\_parameter\_group\_family) | Provide parameter group family | `string` | `"redis6.x"` | no |
| <a name="input_parameter_group_overrides"></a> [parameter\_group\_overrides](#input\_parameter\_group\_overrides) | Optional map of user defined parameters. The map key is the parameter name. | `map(string)` | `{}` | no |
| <a name="input_preferred_cache_cluster_azs"></a> [preferred\_cache\_cluster\_azs](#input\_preferred\_cache\_cluster\_azs) | Set prefered AZ's for the cache clusters | `list(string)` | n/a | yes |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | Provide at least one security group to be associated with this instance. | `list(string)` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Required list of subnets to launch instances in. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_elasticache_arn"></a> [elasticache\_arn](#output\_elasticache\_arn) | n/a |
| <a name="output_elasticache_dns_address"></a> [elasticache\_dns\_address](#output\_elasticache\_dns\_address) | n/a |
| <a name="output_memcached_config_endpoint"></a> [memcached\_config\_endpoint](#output\_memcached\_config\_endpoint) | n/a |
| <a name="output_redis_primary_endpoint"></a> [redis\_primary\_endpoint](#output\_redis\_primary\_endpoint) | n/a |
| <a name="output_redis_reader_endpoint"></a> [redis\_reader\_endpoint](#output\_redis\_reader\_endpoint) | n/a |
<!-- END_TF_DOCS -->
