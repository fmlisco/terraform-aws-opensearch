output "domain_arn" {
  description = "ARN of the OpenSearch Cluster"
  value       = module.opensearch.domain_arn
}

output "domain_name" {
  description = "Name of the OpenSearch Cluster"
  value       = module.opensearch.domain_name
}

output "domain_id" {
  description = "Unique identifier for the Cluster"
  value       = module.opensearch.domain_id
}

output "domain_endpoint" {
  description = "Domain-specific endpoint used to submit index, search, and data upload requests"
  value       = module.opensearch.domain_endpoint
}

output "kibana_endpoint" {
  description = "Domain-specific endpoint for kibana without https scheme."
  value       = module.opensearch.kibana_endpoint
}
