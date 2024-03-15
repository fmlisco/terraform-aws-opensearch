## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4 |
| <a name="requirement_opensearch"></a> [opensearch](#requirement\_opensearch) | >= 1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_opensearch"></a> [opensearch](#provider\_opensearch) | >= 1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [opensearch_dashboard_object.index_pattern](https://registry.terraform.io/providers/opensearch-project/opensearch/latest/docs/resources/dashboard_object) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_pattern"></a> [pattern](#input\_pattern) | The index pattern | `string` | n/a | yes |
| <a name="input_pattern_id"></a> [pattern\_id](#input\_pattern\_id) | The ID of index pattern | `string` | `null` | no |
| <a name="input_time_field_name"></a> [time\_field\_name](#input\_time\_field\_name) | Field name which has the timestamp | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the index pattern |
