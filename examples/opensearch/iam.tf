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
