<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4 |
| <a name="requirement_opensearch"></a> [opensearch](#requirement\_opensearch) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_opensearch"></a> [opensearch](#provider\_opensearch) | 2.2.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [opensearch_dashboard_tenant.this](https://registry.terraform.io/providers/opensearch-project/opensearch/latest/docs/resources/dashboard_tenant) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Dashboard tenant description | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Dashboard tenant name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the dashboard tenant |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
