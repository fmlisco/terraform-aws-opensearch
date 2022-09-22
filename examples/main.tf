module "opensearch" {
  source = "../"

  cluster_name    = var.cluster_name
  engine_version  = var.engine_version
  access_policies = data.aws_iam_policy_document.os_access_policy.json

  create_service_role = false

  instance_count = var.instance_count
  instance_type  = var.instance_type

  ebs_enabled = true
  ebs_iops    = 5000

  subnet_ids = [
    data.aws_cloudformation_export.web_subnet_a.value,
    data.aws_cloudformation_export.web_subnet_b.value,
  ]

  tags = {
    Domain = "TestDomain"
    Name   = var.cluster_name
  }
}
