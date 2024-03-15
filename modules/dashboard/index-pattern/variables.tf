variable "pattern" {
  description = "The index pattern"
  type        = string
}

variable "pattern_id" {
  description = "The ID of index pattern"
  type        = string
  default     = null
}

variable "time_field_name" {
  description = "Field name which has the timestamp"
  type        = string
}
