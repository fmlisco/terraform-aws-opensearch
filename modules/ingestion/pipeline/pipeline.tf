resource "awscc_osis_pipeline" "this" {
  pipeline_name               = var.name
  pipeline_configuration_body = var.configuration_body

  vpc_options = local.vpc_options
  min_units   = var.min_units
  max_units   = var.max_units

  log_publishing_options = {
    is_logging_enabled = var.enable_logging

    cloudwatch_log_destination = {
      log_group = local.pipeline_log_group
    }
  }

  buffer_options = {
    persistent_buffer_enabled = var.persistent_buffer_enabled
  }

  tags = local.pipeline_tags

  depends_on = [
    aws_cloudwatch_log_group.this,
    module.cloudwatch_kms_secret,
  ]
}
