locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name

  pipeline_name = var.pipeline_name != null ? var.pipeline_name : "${var.domain_name}-ingestion-pipeline"

  pipeline_log_group = "/aws/OpenSearchService/IngestionService/${local.pipeline_name}"
}
