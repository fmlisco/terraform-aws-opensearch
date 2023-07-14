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
| [opensearch_composable_index_template.this](https://registry.terraform.io/providers/opensearch-project/opensearch/latest/docs/resources/composable_index_template) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_body"></a> [body](#input\_body) | The JSON body of the index template | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the index template | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the index template |
