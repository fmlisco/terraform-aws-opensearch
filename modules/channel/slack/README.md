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
| [opensearch_channel_configuration.this](https://registry.terraform.io/providers/opensearch-project/opensearch/latest/docs/resources/channel_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Channel config description | `string` | `""` | no |
| <a name="input_id"></a> [id](#input\_id) | Channel config ID | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Channel config name | `string` | n/a | yes |
| <a name="input_webhook_url"></a> [webhook\_url](#input\_webhook\_url) | Slack webhook URL | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the channel configuration |
