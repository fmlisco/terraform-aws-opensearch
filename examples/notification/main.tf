module "slack_channel" {
  source = "../../modules/channel/slack"

  id          = "test_slack"
  name        = "Test slack channel"
  webhook_url = "https://hooks.slack.com/services/test"
}

module "monitor" {
  source = "../../modules/monitor"

  body = {
    name    = "test-monitor"
    type    = "monitor"
    enabled = true

    schedule = {
      period = {
        interval = 1
        unit     = "MINUTES"
      }
    }

    inputs = [
      {
        search = {
          indices = ["movies"]
          query = {
            size         = 0
            aggregations = {}
            query = {
              bool = {
                adjust_pure_negative = true
                boost                = 1

                filter = [
                  {
                    range = {
                      "@timestamp" = {
                        boost         = 1
                        from          = "||-1h"
                        to            = ""
                        include_lower = true
                        include_upper = true
                        format        = "epoch_millis"
                      }
                    }
                  }
                ]
              }
            }
          }
        }
      }
    ]

    triggers = [
      {
        name     = "Errors"
        severity = "1"

        condition = {
          script = {
            source = "ctx.results[0].hits.total.value > 0"
            lang   = "painless"
          }
        }

        actions = [
          {
            name             = "Slack"
            destination_id   = module.slack_channel.id
            throttle_enabled = false
            message_template = {
              source = "bogus"
              lang   = "mustache"
            }
            subject_template = {
              source = "Production Errors"
              lang   = "mustache"
            }
          }
        ]
      }
    ]
  }
}
