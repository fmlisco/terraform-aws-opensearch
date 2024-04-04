## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4 |
| <a name="requirement_opensearch"></a> [opensearch](#requirement\_opensearch) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_opensearch"></a> [opensearch](#provider\_opensearch) | >= 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [opensearch_role.this](https://registry.terraform.io/providers/opensearch-project/opensearch/latest/docs/resources/role) | resource |
| [opensearch_roles_mapping.this](https://registry.terraform.io/providers/opensearch-project/opensearch/latest/docs/resources/roles_mapping) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backend_roles"></a> [backend\_roles](#input\_backend\_roles) | (Optional) Set of backend roles to map to the Opensearch role | `set(string)` | `[]` | no |
| <a name="input_cluster_permissions"></a> [cluster\_permissions](#input\_cluster\_permissions) | Set of cluster permissions to apply to the role | `set(string)` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Opensearch role description | `string` | `""` | no |
| <a name="input_index_permissions"></a> [index\_permissions](#input\_index\_permissions) | Map of index pattern to permissions to apply to the pattern | <pre>map(object(<br>    {<br>      allowed_actions         = set(string)<br>      masked_fields           = optional(set(string))<br>      document_level_security = optional(string)<br>      field_level_security    = optional(set(string))<br>    }<br>  ))</pre> | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Opensearch role name | `string` | n/a | yes |
| <a name="input_tenant_permissions"></a> [tenant\_permissions](#input\_tenant\_permissions) | Map of tenant pattern to set of permissions to apply to the pattern | `map(set(string))` | n/a | yes |
| <a name="input_users"></a> [users](#input\_users) | (Optional) Set of users to map to the Opensearch role | `set(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the role |
