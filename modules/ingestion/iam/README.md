## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.38 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_pipeline_opensearch_policy"></a> [pipeline\_opensearch\_policy](#module\_pipeline\_opensearch\_policy) | terraform-aws-modules/iam/aws//modules/iam-policy | ~> 5.5.0 |
| <a name="module_pipeline_role"></a> [pipeline\_role](#module\_pipeline\_role) | terraform-aws-modules/iam/aws//modules/iam-assumable-role | ~> 5.5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy_document.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_opensearch_domain_arns"></a> [opensearch\_domain\_arns](#input\_opensearch\_domain\_arns) | (Optional) The ARN's of the OpenSearch domains to ingest data into | `list(string)` | `[]` | no |
| <a name="input_pipeline_role_name"></a> [pipeline\_role\_name](#input\_pipeline\_role\_name) | The name of the pipline IAM role | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_opensearch_ingestion_policy_arn"></a> [opensearch\_ingestion\_policy\_arn](#output\_opensearch\_ingestion\_policy\_arn) | ARN of the Opensearch ingestion policy |
| <a name="output_pipeline_role_arn"></a> [pipeline\_role\_arn](#output\_pipeline\_role\_arn) | ARN of the Opensearch ingestion pipeline role |
| <a name="output_pipeline_role_name"></a> [pipeline\_role\_name](#output\_pipeline\_role\_name) | Name of the Opensearch ingestion pipeline role |
