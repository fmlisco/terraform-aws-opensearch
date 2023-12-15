variable "name" {
  description = "Name of the ingestion pipeline"
  type        = string
}

variable "iam_role_name" {
  description = "Name of the pipeline IAM role"
  type        = string
}

variable "configuration_body" {
  description = "The Data Prepper pipeline configuration in YAML format"
  type        = string
}

variable "min_units" {
  description = "The minimum pipeline capacity, in Ingestion Compute Units"
  type        = number
}

variable "max_units" {
  description = "The maximum pipeline capacity, in Ingestion Compute Units"
  type        = number
}

variable "enable_logging" {
  description = "If true, will create a cloudwatch log group to monitor the pipeline"
  type        = bool
  default     = true
}

variable "subnet_ids" {
  description = "Subnet IDs to deploy pipeline in. Only needed if pipeline is to be deployed in VPC mode"
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "Security group IDs to attach to the pipeline"
  type        = list(string)
  default     = []
}

variable "log_group_retention_days" {
  description = "Duration in days for cloudwatch log group retention"
  type        = number
  default     = 30
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
