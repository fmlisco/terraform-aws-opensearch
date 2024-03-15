resource "aws_osis_pipeline" "this" {
  pipeline_name               = var.name
  pipeline_configuration_body = var.configuration_body

  min_units = var.min_units
  max_units = var.max_units

  dynamic "vpc_options" {
    for_each = length(var.subnet_ids) > 0 ? [1] : []

    content {
      subnet_ids         = var.subnet_ids
      security_group_ids = var.security_group_ids
    }
  }

  log_publishing_options {
    is_logging_enabled = var.enable_logging

    dynamic "cloudwatch_log_destination" {
      for_each = var.enable_logging ? [1] : []

      content {
        log_group = local.pipeline_log_group
      }
    }
  }

  buffer_options {
    persistent_buffer_enabled = var.persistent_buffer_enabled
  }

  tags = var.tags

  depends_on = [
    aws_cloudwatch_log_group.this,
    module.cloudwatch_kms_secret,
  ]
}
