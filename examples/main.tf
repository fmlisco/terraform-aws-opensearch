resource "aws_kms_key" "objects" {
  description             = "KMS key is used to encrypt node data"
  deletion_window_in_days = 7
  is_enabled              = true
  enable_key_rotation     = true
}

resource "aws_cloudwatch_log_group" "opensearch" {
  name              = "os-log-group"
  retention_in_days = 30
  kms_key_id        = aws_kms_key.objects.id
}

resource "aws_cloudwatch_log_resource_policy" "opensearch" {
  policy_name = "os-log-policy"

  policy_document = data.aws_iam_policy_document.log_publish_policy.json
}

module "opensearch" {
  source = "../"

  domain_name    = var.domain_name
  engine_version = var.engine_version

  create_service_role = false

  instance_count = var.instance_count
  instance_type  = var.instance_type

  ebs_enabled = true
  ebs_iops    = 5000

  subnet_ids = [
    data.aws_cloudformation_export.web_subnet_a.value,
    data.aws_cloudformation_export.web_subnet_b.value,
  ]

  security_group_ids = [
    data.aws_cloudformation_export.app_sg_id.value,
  ]

  node_to_node_encryption_enabled = true
  encrypt_at_rest_enabled         = true
  encrypt_kms_key_id              = aws_kms_key.objects.id

  tags = {
    Domain = "TestDomain"
    Name   = var.domain_name
  }
}
