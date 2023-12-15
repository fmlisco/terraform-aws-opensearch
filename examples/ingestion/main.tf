locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.name

  domain_name = "domain"

  pipeline_values = {
    region          = local.region
    sts_role_arn    = module.ingestion_iam.pipeline_role_arn
    opensearch_host = "https://example_domain_endpoint"
  }
}

module "ingestion_iam" {
  #checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
  source = "../..//modules/ingestion/iam"

  pipeline_role_name = "opensearch-ingestion-role"
  opensearch_domain_arns = [
    "arn:aws:es:${local.region}:${local.account_id}:domain/${local.domain_name}",
  ]
}

module "ingestion_pipeline" {
  #checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
  source = "../..//modules/ingestion/pipeline"

  name      = "opensearch-ingestion-pipeline"
  min_units = 1
  max_units = 2

  iam_role_name      = module.ingestion_iam.pipeline_role_name
  configuration_body = templatefile("./pipeline.yaml", local.pipeline_values)
}
