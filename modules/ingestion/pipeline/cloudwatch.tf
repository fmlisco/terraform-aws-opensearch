resource "aws_cloudwatch_log_group" "this" {
  #checkov:skip=CKV_AWS_158:Ensure that CloudWatch Log Group is encrypted by KMS
  #checkov:skip=CKV_AWS_338:Ensure that CloudWatch Log Group specifies retention days
  count = var.enable_logging ? 1 : 0

  name              = local.pipeline_log_group
  kms_key_id        = var.cloudwatch_kms_key_id
  retention_in_days = var.log_group_retention_days

  tags = var.tags
}
