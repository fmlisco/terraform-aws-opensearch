resource "aws_iam_policy" "cloudwatch" {
  count  = var.enable_logging ? 1 : 0
  name   = "${var.name}-cloudwatch-policy"
  policy = data.aws_iam_policy_document.pipeline_cloudwatch.json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "cloudwatch" {
  count      = var.enable_logging ? 1 : 0
  role       = var.iam_role_name
  policy_arn = try(aws_iam_policy.cloudwatch[0].arn, "")
}
