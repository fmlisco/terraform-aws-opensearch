locals {
  create_opensearch_ingestion_policy = length(var.opensearch_domain_arns) > 0 ? true : false
}
