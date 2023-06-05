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
| [elasticsearch_index_template.this](https://registry.terraform.io/providers/phillbaker/elasticsearch/latest/docs/resources/index_template) | resource |
| [elasticsearch_opensearch_ism_policy.this](https://registry.terraform.io/providers/phillbaker/elasticsearch/latest/docs/resources/opensearch_ism_policy) | resource |
| [elasticsearch_opensearch_ism_policy_mapping.existing_policies](https://registry.terraform.io/providers/phillbaker/elasticsearch/latest/docs/resources/opensearch_ism_policy_mapping) | resource |
| [elasticsearch_opensearch_ism_policy_mapping.new_policies](https://registry.terraform.io/providers/phillbaker/elasticsearch/latest/docs/resources/opensearch_ism_policy_mapping) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_endpoint"></a> [domain\_endpoint](#input\_domain\_endpoint) | The endpoint of the OpenSearch cluster | `string` | n/a | yes |
| <a name="input_ism_policies"></a> [ism\_policies](#input\_ism\_policies) | A map of all ISM policies. Body should be json encoded | <pre>map(object({<br>    create            = bool<br>    body              = optional(string)<br>    ism_index_pattern = string<br>  }))</pre> | `{}` | no |
| <a name="input_ism_templates"></a> [ism\_templates](#input\_ism\_templates) | A map of ISM templates. Body should be json encoded | `map(any)` | `{}` | no |

## Outputs

No outputs.
