data "aws_iam_policy_document" "pipeline_opensearch" {

  statement {
    effect    = "Allow"
    actions   = ["es:DescribeDomain"]
    resources = [var.domain_arn]
  }

  statement {
    effect    = "Allow"
    actions   = ["es:ESHttp*"]
    resources = ["${var.domain_arn}/*"]
  }
}
