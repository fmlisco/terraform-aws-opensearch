variable "domain_endpoint" {
  description = "The endpoint of the OpenSearch cluster"
  type        = string
}

variable "ism_policies" {
  description = "A map of all ISM policies. Body should be json encoded"
  type = map(object({
    create            = bool
    body              = optional(string)
    ism_index_pattern = string
  }))
  default = {}
}
