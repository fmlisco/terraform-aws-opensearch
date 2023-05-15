resource "elasticsearch_opensearch_ism_policy" "this" {
  for_each = nonsensitive(var.ism_policies)

  policy_id = each.key
  body      = each.value
}

resource "elasticsearch_opensearch_ism_policy_mapping" "this" {
  for_each = nonsensitive(var.ism_policies)

  policy_id = each.key
  indexes   = var.ism_index_pattern

  depends_on = [
    elasticsearch_opensearch_ism_policy.this
  ]
}
