output "pipeline_role_name" {
  description = "Name of the Opensearch ingestion pipeline role"
  value       = module.pipeline_role.iam_role_name
}

output "pipeline_role_arn" {
  description = "ARN of the Opensearch ingestion pipeline role"
  value       = module.pipeline_role.iam_role_arn
}

output "opensearch_ingestion_policy_arn" {
  description = "ARN of the Opensearch ingestion policy"
  value       = local.create_opensearch_ingestion_policy ? module.pipeline_opensearch_policy.arn : null
}
