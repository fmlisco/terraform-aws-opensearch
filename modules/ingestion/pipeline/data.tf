data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_default_tags" "this" {}

data "aws_iam_policy_document" "cloudwatch_log_group" {
  #checkov:skip=CKV_AWS_283=Ensure no IAM policies documents allow ALL or any AWS principal permissions to the resource
  #checkov:skip=CKV_AWS_111=Ensure IAM policies does not allow write access without constraints
  #checkov:skip=CKV_AWS_356:Ensure IAM policies limit resource access
  statement {
    sid = "AllowKmsAccess"

    principals {
      type = "AWS"
      identifiers = [
        "*"
      ]
    }

    actions = [
      "kms:Encrypt*",
      "kms:Decrypt*",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:Describe*"
    ]
    resources = ["*"]
    condition {
      test     = "ArnLike"
      variable = "kms:EncryptionContext:aws:logs:arn"
      values   = ["arn:aws:logs:${local.region}:${local.account_id}:log-group:${local.pipeline_log_group}"]
    }
  }
}

data "aws_iam_policy_document" "pipeline_cloudwatch" {
  #checkov:skip=CKV_AWS_283=Ensure no IAM policies documents allow ALL or any AWS principal permissions to the resource
  #checkov:skip=CKV_AWS_111=Ensure IAM policies does not allow write access without constraints
  #checkov:skip=CKV_AWS_356=Ensure IAM policies limit resource access
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogDelivery",
      "logs:PutResourcePolicy",
      "logs:UpdateLogDelivery",
      "logs:DeleteLogDelivery",
      "logs:DescribeResourcePolicies",
      "logs:GetLogDelivery",
      "logs:ListLogDeliveries"
    ]

    resources = [
      "arn:aws:logs:${local.region}:${local.account_id}:log-group:${local.pipeline_log_group}",
      "arn:aws:logs:${local.region}:${local.account_id}:log-group:${local.pipeline_log_group}:log-stream:*"
    ]
  }
}
