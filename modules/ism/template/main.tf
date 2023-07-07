resource "opensearch_index_template" "this" {
  name = var.name
  body = var.body
}
