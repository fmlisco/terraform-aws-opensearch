resource "aws_cloudwatch_log_group" "this" {
  #checkov:skip=CKV_AWS_338:Ensure that CloudWatch Log Group specifies retention days
  count = var.enable_logging ? 1 : 0

  name              = local.pipeline_log_group
  kms_key_id        = try(module.cloudwatch_kms_secret[0].key_arn, "")
  retention_in_days = var.log_group_retention_days

  tags = var.tags
}

module "cloudwatch_kms_secret" {
  source  = "SPHTech-Platform/kms/aws"
  version = "~> 0.1.0"
  count   = var.enable_logging ? 1 : 0

  key_description       = "Encrypt cloudwatch log group for ${var.name}"
  alias                 = "alias/${join("-", [var.name, "key"])}"
  key_policy_statements = [data.aws_iam_policy_document.cloudwatch_log_group.json]
}
