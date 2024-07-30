variable "name" {
  description = "Channel config name"
  type        = string
}

variable "id" {
  description = "Channel config ID"
  type        = string
}

variable "description" {
  description = "Channel config description"
  type        = string
  default     = ""
}

variable "webhook_url" {
  description = "Slack webhook URL"
  type        = string
}
