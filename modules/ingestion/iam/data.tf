data "aws_iam_policy_document" "opensearch_ingestion" {

  statement {
    effect    = "Allow"
    actions   = ["es:DescribeDomain"]
    resources = var.opensearch_domain_arns
  }

  statement {
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
