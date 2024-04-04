resource "opensearch_dashboard_tenant" "this" {
  tenant_name = var.name
  description = var.description
}
