resource "elasticsearch_opensearch_ism_policy" "this" {
  for_each = nonsensitive(local.new_ism_policies)

  policy_id = each.key
  body      = each.value.body
}

resource "elasticsearch_opensearch_ism_policy_mapping" "new_policies" {
  for_each = nonsensitive(local.new_ism_policies)

  policy_id = each.key
  indexes   = each.value.ism_index_pattern

  depends_on = [
    elasticsearch_opensearch_ism_policy.this
  ]
}

resource "elasticsearch_opensearch_ism_policy_mapping" "existing_policies" {
  for_each = nonsensitive(local.existing_ism_policies)

  policy_id = each.key
  indexes   = each.value.ism_index_pattern
}

resource "elasticsearch_index_template" "this" {
  for_each = nonsensitive(var.ism_templates)

  name = each.key
  body = each.value
}
