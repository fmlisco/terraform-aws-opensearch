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

  domain_name = local.domain_name
  domain_arn  = "arn:aws:es:${local.region}:${local.account_id}:domain/${local.domain_name}"
}

module "ingestion_pipeline" {
  #checkov:skip=CKV_TF_1:Ensure Terraform module sources use a commit hash
  source = "../..//modules/ingestion/pipeline"

  domain_name = local.domain_name

  pipeline_name      = "${local.domain_name}-pipeline"
  pipeline_min_units = 1
  pipeline_max_units = 2

  pipeline_role_name          = module.ingestion_iam.pipeline_role_name
  pipeline_configuration_body = templatefile("./pipeline.yaml", local.pipeline_values)
}
