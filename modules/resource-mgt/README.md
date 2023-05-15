# Opensearch Resource Management

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_elasticsearch"></a> [elasticsearch](#requirement\_elasticsearch) | ~> 2.0.7 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_elasticsearch"></a> [elasticsearch](#provider\_elasticsearch) | ~> 2.0.7 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [elasticsearch_opensearch_ism_policy.this](https://registry.terraform.io/providers/phillbaker/elasticsearch/latest/docs/resources/opensearch_ism_policy) | resource |
| [elasticsearch_opensearch_ism_policy_mapping.this](https://registry.terraform.io/providers/phillbaker/elasticsearch/latest/docs/resources/opensearch_ism_policy_mapping) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_endpoint"></a> [domain\_endpoint](#input\_domain\_endpoint) | The endpoint of the OpenSearch cluster | `string` | n/a | yes |
| <a name="input_ism_index_pattern"></a> [ism\_index\_pattern](#input\_ism\_index\_pattern) | Index pattern to apply ISM policies to | `string` | `null` | no |
| <a name="input_ism_policies"></a> [ism\_policies](#input\_ism\_policies) | A map of all ISM policies to create. Value should be json encoded | `map(string)` | `{}` | no |

## Outputs

No outputs.
