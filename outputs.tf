output "cluster_arn" {
  description = "ARN of the OpenSearch Cluster"
  value       = aws_opensearch_domain.this.arn
}

output "cluster_name" {
  description = "Name of the OpenSearch Cluster"
  value       = aws_opensearch_domain.this.domain_name
}

output "cluster_id" {
  description = "Unique identifier for the Cluster"
  value       = aws_opensearch_domain.this.domain_id
}

output "cluster_endpoint" {
  description = "Domain-specific endpoint used to submit index, search, and data upload requests"
  value       = aws_opensearch_domain.this.endpoint
}

output "kibana_endpoint" {
  description = "Domain-specific endpoint for kibana without https scheme."
  value       = aws_opensearch_domain.this.kibana_endpoint
}
