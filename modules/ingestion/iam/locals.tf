locals {
  create_opensearch_ingestion_policy = length(var.opensearch_domain_arns) > 0 ? true : false

  custom_role_policy_arns = local.create_opensearch_ingestion_policy ? merge(var.custom_role_policy_arns, [module.pipeline_opensearch_policy.arn]) : var.custom_role_policy_arns
}
