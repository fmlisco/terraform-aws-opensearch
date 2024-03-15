locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name

  pipeline_log_group = "/aws/vendedlogs/OpenSearchIngestion/${var.name}/audit-logs"
}
