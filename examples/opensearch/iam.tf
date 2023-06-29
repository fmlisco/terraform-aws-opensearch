data "aws_iam_policy_document" "os_access_policy" {
  statement {
    sid = "Allow-Whitelisted-IPs"

    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = ["es:*"]

    resources = ["arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${var.domain_name}/*"]

    condition {
      test     = "IpAddress"
      variable = "aws:SourcedIp"
      values   = var.whitelist_ips
    }
  }
}

data "aws_iam_policy_document" "log_publish_policy" {
  statement {
    sid = "OS-Log-Publish-Policy"

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["es.amazonaws.com"]
    }

    actions = [
      "logs:PutLogEvents",
      "logs:PutLogEventsBatch",
      "logs:CreateLogStream",
    ]

    resources = ["arn:aws:logs:*"]

  }
}
