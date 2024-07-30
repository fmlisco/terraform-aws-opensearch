resource "opensearch_monitor" "this" {
  body = jsonencode(var.body)
}
