resource "aws_opensearch_domain" "this" {
  # service linked role must exist and default cloudwatch log_group created.
  depends_on = [
    aws_iam_service_linked_role.aos,
    aws_cloudwatch_log_group.aos,
  ]

  domain_name     = var.domain_name
  engine_version  = var.engine_version
  access_policies = data.aws_iam_policy_document.combined.json

  cluster_config {
    dedicated_master_enabled = var.master_instance_enabled
    dedicated_master_count   = var.master_instance_enabled ? var.master_instance_count : null
    dedicated_master_type    = var.master_instance_enabled ? var.master_instance_type : null

    instance_count = var.instance_count
    instance_type  = var.instance_type

    warm_enabled = var.warm_instance_enabled
    warm_count   = var.warm_instance_enabled ? var.warm_instance_count : null
    warm_type    = var.warm_instance_enabled ? var.warm_instance_type : null

    zone_awareness_enabled = (var.availability_zones > 1) ? true : false

    dynamic "zone_awareness_config" {
      for_each = (var.availability_zones > 1) ? [var.availability_zones] : []
      content {
        availability_zone_count = zone_awareness_config.value
      }
    }

    cold_storage_options {
      enabled = var.cold_storage_enabled
    }
  }

  vpc_options {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.security_group_ids
  }

  advanced_security_options {
    enabled                        = var.advanced_security_options_enabled
    anonymous_auth_enabled         = var.anonymous_auth_enabled
    internal_user_database_enabled = var.internal_user_database_enabled

    master_user_options {
      master_user_arn      = (!var.internal_user_database_enabled && var.master_user_arn != "") ? var.master_user_arn : null
      master_user_name     = (var.internal_user_database_enabled && var.master_user_arn == "") ? var.master_user_name : null
      master_user_password = (var.internal_user_database_enabled && var.master_user_arn == "") ? var.master_user_password : null
    }
  }

  domain_endpoint_options {
    enforce_https       = true
    tls_security_policy = "Policy-Min-TLS-1-2-2019-07"

    custom_endpoint_enabled         = var.custom_endpoint_enabled
    custom_endpoint                 = var.custom_endpoint_enabled ? var.custom_endpoint : null
    custom_endpoint_certificate_arn = var.custom_endpoint_enabled ? var.custom_endpoint_certificate_arn : null
  }

  node_to_node_encryption {
    enabled = var.node_to_node_encryption_enabled
  }

  encrypt_at_rest {
    enabled    = var.encrypt_at_rest_enabled
    kms_key_id = var.encrypt_kms_key_id
  }

  ebs_options {
    ebs_enabled = var.ebs_enabled
    volume_type = var.ebs_enabled ? var.ebs_volume_type : null
    volume_size = var.ebs_enabled ? var.ebs_volume_size : null
    iops        = can(regex("gp3|io1|io2", var.ebs_volume_type)) ? var.ebs_iops : null
    throughput  = var.ebs_volume_type == "gp3" ? var.ebs_gp3_throughput : null
  }

  dynamic "log_publishing_options" {
    for_each = { for k, v in local.log_publishing_options : k => v if v.enabled }
    content {
      log_type                 = upper(log_publishing_options.key)
      enabled                  = log_publishing_options.value.enabled
      cloudwatch_log_group_arn = try(log_publishing_options.value.cloudwatch_log_group_arn, "") != "" ? log_publishing_options.value.cloudwatch_log_group_arn : aws_cloudwatch_log_group.aos[log_publishing_options.key].arn
    }
  }

  tags = var.tags

}

resource "aws_opensearch_domain_saml_options" "this" {
  count = var.saml_enabled ? 1 : 0

  domain_name = aws_opensearch_domain.this.domain_name

  saml_options {
    enabled                 = var.saml_options_enabled
    subject_key             = var.saml_subject_key
    roles_key               = var.saml_roles_key
    session_timeout_minutes = var.saml_session_timeout
    master_user_name        = var.saml_master_user_name
    master_backend_role     = var.saml_master_backend_role

    idp {
      entity_id        = var.saml_entity_id
      metadata_content = var.saml_metadata_content
    }
  }
}
