data "aws_iam_policy_document" "opensearch_ingestion" {
  count = local.create_opensearch_ingestion_policy ? 1 : 0

  dynamic "statement" {
    for_each = local.create_opensearch_ingestion_policy ? [1] : []
    content {
      effect    = "Allow"
      actions   = ["es:DescribeDomain"]
      resources = var.opensearch_domain_arns
    }
  }

  dynamic "statement" {
    for_each = local.create_opensearch_ingestion_policy ? [1] : []
    content {
      effect = "Allow"
      actions = [
        "es:ESHttpGet",
        "es:ESHttpHead",
        "es:ESHttpPatch",
        "es:ESHttpPost",
        "es:ESHttpPut",
      ]
      resources = [for domain in var.opensearch_domain_arns : "${domain}/*"]
    }
  }
}

moved {
  from = data.aws_iam_policy_document.opensearch_ingestion
  to   = data.aws_iam_policy_document.opensearch_ingestion[0]
}
