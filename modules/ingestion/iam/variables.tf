variable "domain_name" {
  description = "The name of the OpenSearch cluster"
  type        = string
}

variable "domain_arn" {
  description = "The ARN of the OpenSearch cluster"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
