locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name

  pipeline_name = var.pipeline_name != null ? var.pipeline_name : var.domain_name

  pipeline_log_group = "/aws/vendedlogs/OpenSearchIngestion/${local.pipeline_name}/audit-logs"

  pipeline_tags = [for k, v in merge(var.tags, data.aws_default_tags.this.tags) : {
    key   = k
    value = v
  }]
}
