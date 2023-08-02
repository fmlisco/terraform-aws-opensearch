## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4  |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.38 |
| <a name="requirement_awscc"></a> [awscc](#requirement\_awscc) | >= 0.52 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |
| <a name="provider_awscc"></a> [awscc](#provider\_awscc) | 0.52.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudwatch_kms_secret"></a> [cloudwatch\_kms\_secret](#module\_cloudwatch\_kms\_secret) | SPHTech-Platform/kms/aws | ~> 0.1.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_policy.cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role_policy_attachment.cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [awscc_osis_pipeline.this](https://registry.terraform.io/providers/hashicorp/awscc/latest/docs/resources/osis_pipeline) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_default_tags.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/default_tags) | data source |
| [aws_iam_policy_document.cloudwatch_log_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.pipeline_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The name of the OpenSearch cluster | `string` | n/a | yes |
| <a name="input_pipeline_configuration_body"></a> [pipeline\_configuration\_body](#input\_pipeline\_configuration\_body) | The Data Prepper pipeline configuration in YAML format | `string` | n/a | yes |
| <a name="input_pipeline_enable_logging"></a> [pipeline\_enable\_logging](#input\_pipeline\_enable\_logging) | If true, will create a cloudwatch log group to monitor the pipeline | `bool` | `true` | no |
| <a name="input_pipeline_log_group_retention_days"></a> [pipeline\_log\_group\_retention\_days](#input\_pipeline\_log\_group\_retention\_days) | Duration in days for cloudwatch log group retention | `number` | `30` | no |
| <a name="input_pipeline_max_units"></a> [pipeline\_max\_units](#input\_pipeline\_max\_units) | The maximum pipeline capacity, in Ingestion Compute Units | `number` | n/a | yes |
| <a name="input_pipeline_min_units"></a> [pipeline\_min\_units](#input\_pipeline\_min\_units) | The minimum pipeline capacity, in Ingestion Compute Units | `number` | n/a | yes |
| <a name="input_pipeline_name"></a> [pipeline\_name](#input\_pipeline\_name) | Name of the ingestion pipeline | `string` | `null` | no |
| <a name="input_pipeline_role_name"></a> [pipeline\_role\_name](#input\_pipeline\_role\_name) | Name of the pipeline role to use | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ingest_endpoint_urls"></a> [ingest\_endpoint\_urls](#output\_ingest\_endpoint\_urls) | The ingestion endpoints for the pipeline that you can send data to |
| <a name="output_pipeline_arn"></a> [pipeline\_arn](#output\_pipeline\_arn) | ARN of the ingestion pipeline |
| <a name="output_pipeline_name"></a> [pipeline\_name](#output\_pipeline\_name) | Name of the ingestion pipeline |
