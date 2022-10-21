output "cluster_arn" {
  description = "ARN of the OpenSearch Cluster"
  value       = module.opensearch.cluster_arn
}

output "cluster_name" {
  description = "Name of the OpenSearch Cluster"
  value       = module.opensearch.cluster_name
}

output "cluster_id" {
  description = "Unique identifier for the Cluster"
  value       = module.opensearch.cluster_id
}

output "cluster_endpoint" {
  description = "Domain-specific endpoint used to submit index, search, and data upload requests"
  value       = module.opensearch.cluster_endpoint
}

output "kibana_endpoint" {
  description = "Domain-specific endpoint for kibana without https scheme."
  value       = module.opensearch.kibana_endpoint
}
