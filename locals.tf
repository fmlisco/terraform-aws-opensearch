locals {
  log_publishing_options_default = {
    audit_logs = {
      enabled = false
    }
    index_slow_logs = {
      enabled = true
    }
  }
  log_publishing_options = merge(local.log_publishing_options_default, var.log_publishing_options)
}
