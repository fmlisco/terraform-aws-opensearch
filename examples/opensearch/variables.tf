variable "domain_name" {
  description = "Name of the cluster"
  type        = string
  default     = "opensearch-test-cluster"
}

variable "engine_version" {
  description = "OpenSearch engine version"
  type        = string
  default     = "OpenSearch_1.3"
}

variable "instance_count" {
  description = "OpenSearch instance count"
  type        = number
  default     = 2
}

variable "instance_type" {
  description = "OpenSearch instance type"
  type        = string
  default     = "t3.small.search"
}

variable "cf_export_web_subnet_a" {
  description = "cf_export_web_subnet_a"
  type        = string
  default     = "subnetIDWebA-ap-southeast-1"
}

variable "cf_export_web_subnet_b" {
  description = "cf_export_web_subnet_b"
  type        = string
  default     = "subnetIDWebB-ap-southeast-1"
}

variable "cf_export_app_sg_id" {
  description = "app security group id"
  type        = string
  default     = "securityGroupIDApplication-ap-southeast-1"
}
