resource "aws_iam_service_linked_role" "aos" {
  count = var.create_service_role ? 1 : 0

  aws_service_name = "opensearchservice.amazonaws.com"
}

data "aws_iam_policy_document" "aos_access_policy" {
  statement {
    sid = "admin"

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = ["es:*"]

    resources = ["arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${var.domain_name}/*"]
  }

  dynamic "statement" {
    for_each = length(var.subnet_ids) == 0 ? [1] : []
    content {
      sid = "client"

      effect = "Allow"

      principals {
        type        = "*"
        identifiers = ["*"]
      }

      actions = ["es:ESHttp*"]

      resources = ["arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${var.domain_name}/*"]

      condition {
        test     = "IpAddress"
        variable = "aws:SourceIp"

        values = distinct(compact(var.whitelist_ips))
      }
    }
  }
}

data "aws_iam_policy_document" "combined" {
  source_policy_documents = [
    data.aws_iam_policy_document.aos_access_policy.json,
    var.access_policies,
  ]
}
