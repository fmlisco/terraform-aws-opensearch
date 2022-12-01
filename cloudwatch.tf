locals {
  log_prefix = "/aws/OpenSearchService/domains/${var.domain_name}"
}

resource "aws_cloudwatch_log_group" "aos" {
  #checkov:skip=CKV_AWS_158:rely on aws default encryption
  for_each = { for k, v in local.log_publishing_options : k => v if v.enabled }

  name              = "${local.log_prefix}/${each.key}"
  retention_in_days = 7
}

data "aws_iam_policy_document" "aos_log_publishing" {
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:PutLogEventsBatch",
    ]

    resources = ["arn:aws:logs:*:*:log-group:${local.log_prefix}/*:*"]

    principals {
      identifiers = ["es.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_cloudwatch_log_resource_policy" "aos_log_publishing" {
  policy_document = data.aws_iam_policy_document.aos_log_publishing.json
  policy_name     = "opensearch-${var.domain_name}-logs"
}
