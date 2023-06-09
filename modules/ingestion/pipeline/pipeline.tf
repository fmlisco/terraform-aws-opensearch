resource "awscc_osis_pipeline" "this" {
  pipeline_name               = local.pipeline_name
  pipeline_configuration_body = var.pipeline_configuration_body

  min_units = var.pipeline_min_units
  max_units = var.pipeline_max_units

  log_publishing_options = {
    is_logging_enabled = var.pipeline_enable_logging
    cloudwatch_log_destination = {
      log_group = local.pipeline_log_group
    }
  }

  tags = local.pipeline_tags
}
