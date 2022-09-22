data "aws_iam_policy_document" "os_access_policy" {
  statement {
    sid = "Allow-SPH-IPs"

    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = ["es:*"]

    resources = ["rn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${var.cluster_name}/*"]

    condition {
      test     = "IpAddress"
      variable = "aws:SourcedIp"
      values   = var.whitelist_ips
    }
  }
}
