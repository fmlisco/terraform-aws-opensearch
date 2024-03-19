module "pipeline_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "~> 5.5.0"

  create_role      = true
  role_name        = var.pipeline_role_name
  role_description = "IAM Role to be assumed by Opensearch ingestion pipeline"

  trusted_role_services = [
    "osis-pipelines.amazonaws.com",
  ]
  role_requires_mfa       = false
  custom_role_policy_arns = local.create_opensearch_ingestion_policy ? concat(var.custom_role_policy_arns, [module.pipeline_opensearch_policy[0].arn]) : var.custom_role_policy_arns

  tags = var.tags
}

module "pipeline_opensearch_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "~> 5.5.0"

  count = local.create_opensearch_ingestion_policy ? 1 : 0

  name        = "${var.pipeline_role_name}-ingestion-policy"
  path        = "/"
  description = "IAM Policy for Opensearch ingestion"
  policy      = data.aws_iam_policy_document.opensearch_ingestion[0].json

  tags = var.tags
}

moved {
  from = module.pipeline_opensearch_policy
  to   = module.pipeline_opensearch_policy[0]
}
