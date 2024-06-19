locals {
  id = coalesce(var.pattern_id, split("-*", var.pattern)[0])
}

resource "opensearch_dashboard_object" "index_pattern" {
  tenant_name = var.tenant_name
  body        = <<EOF
[
  {
    "_id": "index-pattern:${local.id}",
    "_type": "doc",
    "_source": {
      "type": "index-pattern",
      "index-pattern": {
        "title": "${var.pattern}",
        "timeFieldName": "${var.time_field_name}"
      }
    }
  }
]
EOF
}
