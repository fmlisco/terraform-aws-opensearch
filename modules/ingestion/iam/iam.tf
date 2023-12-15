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
  custom_role_policy_arns = local.create_opensearch_ingestion_policy ? [module.pipeline_opensearch_policy.arn] : []

  tags = var.tags
}

module "pipeline_opensearch_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"
  version = "~> 5.5.0"

  create_policy = local.create_opensearch_ingestion_policy

  name        = "${var.pipeline_role_name}-ingestion-policy"
  path        = "/"
  description = "IAM Policy for Opensearch ingestion"
  policy      = data.aws_iam_policy_document.opensearch_ingestion.json

  tags = var.tags
}
