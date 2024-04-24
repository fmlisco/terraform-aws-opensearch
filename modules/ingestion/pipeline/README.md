<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.36 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.46.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_policy.cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role_policy_attachment.cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_osis_pipeline.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/osis_pipeline) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.pipeline_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudwatch_kms_key_id"></a> [cloudwatch\_kms\_key\_id](#input\_cloudwatch\_kms\_key\_id) | (Optional) KMS key ID for Cloudwatch logs | `string` | `null` | no |
| <a name="input_configuration_body"></a> [configuration\_body](#input\_configuration\_body) | The Data Prepper pipeline configuration in YAML format | `string` | n/a | yes |
| <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging) | If true, will create a cloudwatch log group to monitor the pipeline | `bool` | `true` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Name of the pipeline IAM role | `string` | n/a | yes |
| <a name="input_log_group_retention_days"></a> [log\_group\_retention\_days](#input\_log\_group\_retention\_days) | Duration in days for cloudwatch log group retention | `number` | `30` | no |
| <a name="input_max_units"></a> [max\_units](#input\_max\_units) | The maximum pipeline capacity, in Ingestion Compute Units | `number` | n/a | yes |
| <a name="input_min_units"></a> [min\_units](#input\_min\_units) | The minimum pipeline capacity, in Ingestion Compute Units | `number` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the ingestion pipeline | `string` | n/a | yes |
| <a name="input_persistent_buffer_enabled"></a> [persistent\_buffer\_enabled](#input\_persistent\_buffer\_enabled) | Whether persistent buffering should be enabled | `bool` | `false` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | Security group IDs to attach to the pipeline | `list(string)` | `[]` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Subnet IDs to deploy pipeline in. Only needed if pipeline is to be deployed in VPC mode | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the ingestion pipeline |
| <a name="output_id"></a> [id](#output\_id) | ID of the ingestion pipeline |
| <a name="output_ingest_endpoint_urls"></a> [ingest\_endpoint\_urls](#output\_ingest\_endpoint\_urls) | The ingestion endpoints for the pipeline that you can send data to |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
