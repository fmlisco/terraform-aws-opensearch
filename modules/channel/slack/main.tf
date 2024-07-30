resource "opensearch_channel_configuration" "this" {
  body = jsonencode(
    {
      config_id = var.id

      config = {
        name        = var.name
        description = var.description
        config_type = "slack"
        is_enabled  = true

        slack = {
          url = var.webhook_url
        }
      }
    }
  )
}
