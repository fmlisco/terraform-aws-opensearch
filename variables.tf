variable "domain_name" {
  description = "The name of the OpenSearch cluster."
  type        = string
}

variable "engine_version" {
  description = "Specify the engine version for the Amazon OpenSearch Service domain"
  type        = string
  default     = "OpenSearch_1.3"

  validation {
    condition     = can(regex("^OpenSearch", var.engine_version))
    error_message = "Incorrect engine version for the OpenSearch."
  }
}

variable "access_policies" {
  description = "IAM policy document specifying the access policies for the domain"
  type        = string
  default     = ""
}

# once proper authentication added, this will be removed
variable "whitelist_ips" {
  description = "Whitelisted client ip address to access."
  type        = list(string)
  default     = []
}

variable "create_service_role" {
  description = "Indicates whether to create the service-linked role. See https://docs.aws.amazon.com/opensearch-service/latest/developerguide/slr.html"
  type        = bool
  default     = false
}

variable "master_user_arn" {
  description = "The ARN for the master user of the cluster. If not specified, then it defaults to using the IAM user that is making the request."
  type        = string
  default     = ""
}

variable "master_user_name" {
  description = "Main user's username, which is stored in the Amazon OpenSearch Service domain's internal database"
  type        = string
  default     = ""
}

variable "master_user_password" {
  description = "Main user's password, which is stored in the Amazon OpenSearch Service domain's internal database"
  type        = string
  default     = ""
}

variable "master_instance_enabled" {
  description = "Indicates whether dedicated master nodes are enabled for the cluster."
  type        = bool
  default     = true
}

variable "master_instance_type" {
  description = "The type of EC2 instances to run for each master node. A list of available instance types can you find at https://aws.amazon.com/en/opensearch-service/pricing/#On-Demand_instance_pricing"
  type        = string
  default     = "t3.small.search"

  validation {
    condition     = can(regex("^[t3|m5|m6g|r5|r6g|r6gd|i3|c5|c6g]", var.master_instance_type))
    error_message = "The EC2 master_instance_type must provide a SSD or NVMe-based local storage."
  }
}

variable "master_instance_count" {
  description = "The number of dedicated master nodes in the cluster."
  type        = number
  default     = 3
}

variable "instance_type" {
  description = "The type of EC2 instances to run for each hot node. A list of available instance types can you find at https://aws.amazon.com/en/opensearch-service/pricing/#On-Demand_instance_pricing"
  type        = string
  default     = "t3.small.search"

  validation {
    condition     = can(regex("^[t3|m5|m6g|r5|r6g|r6gd|i3|c5|c6g]", var.instance_type))
    error_message = "The EC2 instance_type must provide a SSD or NVMe-based local storage."
  }
}

variable "instance_count" {
  description = "The number of dedicated hot nodes in the cluster."
  type        = number
  default     = 3
}

variable "warm_instance_enabled" {
  description = "Indicates whether ultrawarm nodes are enabled for the cluster."
  type        = bool
  default     = false
}

variable "warm_instance_type" {
  description = "The type of EC2 instances to run for each warm node. A list of available instance types can you find at https://aws.amazon.com/en/elasticsearch-service/pricing/#UltraWarm_pricing"
  type        = string
  default     = "ultrawarm1.medium.search"

  validation {
    condition     = can(regex("ultrawarm1.medium.search|ultrawarm1.large.search|ultrawarm1.xlarge.search", var.warm_instance_type))
    error_message = "Warm Instance Type is not matching with ultrawarm1.medium.search, ultrawarm1.large.search, ultrawarm1.xlarge.search."
  }
}

variable "warm_instance_count" {
  description = "The number of dedicated warm nodes in the cluster."
  type        = number
  default     = 3
}

variable "cold_storage_enabled" {
  description = "Enable cold storage. Master and ultrawarm nodes must be enabled for cold storage."
  type        = bool
  default     = false
}

variable "availability_zones" {
  description = "The number of availability zones for the OpenSearch cluster. Valid values: 1, 2 or 3."
  type        = number
  default     = 3
}

variable "encrypt_at_rest_enabled" {
  description = "Enable encrypt at rest."
  type        = bool
  default     = true
}

variable "encrypt_kms_key_id" {
  description = "The KMS key ID to encrypt the OpenSearch cluster with. If not specified, then it defaults to using the AWS OpenSearch Service KMS key."
  type        = string
  default     = null
}

variable "node_to_node_encryption_enabled" {
  description = "Enable node-to-node encryption."
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

variable "ebs_enabled" {
  description = "Whether EBS volumes are attached to data nodes in the domain"
  type        = bool
  default     = false
}

variable "ebs_volume_type" {
  description = "Type of EBS volumes attached to data nodes"
  type        = string
  default     = "gp3"
}

variable "ebs_volume_size" {
  description = "Size of EBS volumes attached to data nodes (in GiB)"
  type        = number
  default     = 10
}

variable "ebs_gp3_throughput" {
  description = "Specifies the throughput (in MiB/s) of the EBS volumes attached to data nodes. Applicable only for the gp3 volume type. Valid values are between 125 and 1000"
  type        = number
  default     = 125

  validation {
    condition = (
      var.ebs_gp3_throughput >= 125 &&
      var.ebs_gp3_throughput <= 1000
    )
    error_message = "Must be between 125 and 1000 MiB/s."
  }
}

variable "ebs_iops" {
  description = "Baseline input/output (I/O) performance of EBS volumes attached to data nodes. Applicable only for the GP3 and Provisioned IOPS EBS volume types"
  type        = number
  default     = 3000
}

variable "custom_endpoint_enabled" {
  description = "custom endpoint enabled"
  type        = bool
  default     = false
}

variable "custom_endpoint" {
  description = "Custom Endpoint URL"
  type        = string
  default     = null
}

variable "custom_endpoint_certificate_arn" {
  description = "Custom Endpoint Certificate ARN"
  type        = string
  default     = null
}

variable "subnet_ids" {
  description = "List of VPC Subnet IDs for the OpenSearch domain endpoints to be created in"
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "List of VPC Security Group IDs to be applied to the OpenSearch domain endpoints. If omitted, the default Security Group for the VPC will be used"
  type        = list(string)
  default     = []
}

variable "advanced_security_options_enabled" {
  description = "Whether advanced security is enabled"
  type        = bool
  default     = false
}

variable "anonymous_auth_enabled" {
  description = "Whether Anonymous auth is enabled. Enables fine-grained access control on an existing domain. Ignored unless advanced_security_options are enabled. Can only be enabled on an existing domain"
  type        = bool
  default     = false
}

variable "internal_user_database_enabled" {
  description = "Whether the internal user database is enabled"
  type        = bool
  default     = false
}

##########
## SAML ##
##########
variable "saml_enabled" {
  description = "Whether SAML authentication is enabled"
  type        = bool
  default     = false
}

variable "saml_options_enabled" {
  description = "Whether SAML authentication options for an AWS OpenSearch Domain is enabled"
  type        = bool
  default     = false
}

variable "saml_subject_key" {
  description = "Element of the SAML assertion to use for username."
  type        = string
  default     = ""
}

variable "saml_roles_key" {
  description = "Element of the SAML assertion to use for backend roles."
  type        = string
  default     = ""
}

variable "saml_entity_id" {
  description = "The unique Entity ID of the application in SAML Identity Provider."
  type        = string
  default     = ""
}

variable "saml_metadata_content" {
  description = "The metadata of the SAML application in xml format."
  type        = string
  default     = ""
}

variable "saml_session_timeout" {
  description = "Duration of a session in minutes after a user logs in. Default is 60. Maximum value is 1,440."
  type        = number
  default     = 60
}

variable "saml_master_backend_role" {
  description = "This backend role receives full permissions to the cluster, equivalent to a new master role, but can only use those permissions within Dashboards."
  type        = string
  default     = null
}

variable "saml_master_user_name" {
  description = "This username receives full permissions to the cluster, equivalent to a new master user, but can only use those permissions within Dashboards."
  type        = string
  default     = null
}

variable "log_publishing_options" {
  description = "Configuration block for publishing slow and application logs to CloudWatch Logs."
  # key is log_type, valid values: index_slow_logs, search_slow_logs, es_application_logs, audit_logs
  type = map(object({
    enabled                  = optional(bool, true)
    cloudwatch_log_group_arn = optional(string, "")
  }))
  default = {}
}


############
## Alerts ##
############

variable "red_cluster_status_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold"
  type        = number
  default     = 1
}

variable "red_cluster_status_period" {
  description = "The period in seconds over which the specified statistic is applied"
  type        = number
  default     = 60
}

variable "red_cluster_status_threshold" {
  description = "The value against which the specified statistic is compared. This parameter is required for alarms based on static thresholds, but should not be used for alarms based on anomaly detection models"
  type        = number
  default     = 1
}

variable "alarm_actions" {
  description = "The list of actions to execute when this alarm transitions into an ALARM state from any other state. Each action is specified as an Amazon Resource Name (ARN)"
  type        = list(string)
  default     = []
}

variable "ok_actions" {
  description = "The list of actions to execute when this alarm transitions into an OK state from any other state. Each action is specified as an Amazon Resource Name (ARN)"
  type        = list(string)
  default     = []
}

variable "auto_tune_desired_state" {
  description = "The Auto-Tune desired state for the domain. Valid values: ENABLED or DISABLED"
  type        = string
  default     = "ENABLED"
}
