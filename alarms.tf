locals {
  minute = 60

  default_alarms = {
    # cluster status
    cluster_status_red = {
      alarm_name        = "${aws_opensearch_domain.this.domain_name}_cluster_status_red"
      alarm_description = "${aws_opensearch_domain.this.domain_name} has entered redstatus. One or more primary shard and its replicaes are not allocated to a node"

      comparison_operator = "GreaterThanOrEqualToThreshold"
      evaluation_periods  = 1
      threshold           = 1
      period              = 1 * local.minute

      namespace          = "ES/OpenSearchService"
      metric_name        = "ClusterStatus.red"
      statistic          = "Maximum"
      treat_missing_data = "notBreaching"

      dimensions = {
        DomainName = aws_opensearch_domain.this.domain_name
      }
      alarm_actions = var.alarm_actions
    }

    cluster_status_yellow = {
      alarm_name        = "${aws_opensearch_domain.this.domain_name}_cluster_status_yellow"
      alarm_description = "${aws_opensearch_domain.this.domain_name} has entered yellow status. One or more indexes do not have a replica shard. "

      comparison_operator = "GreaterThanOrEqualToThreshold"
      evaluation_periods  = 5
      threshold           = 1
      period              = 1 * local.minute

      namespace          = "ES/OpenSearchService"
      metric_name        = "ClusterStatus.yellow"
      statistic          = "Maximum"
      treat_missing_data = "notBreaching"

      dimensions = {
        DomainName = aws_opensearch_domain.this.domain_name
      }
      alarm_actions = var.alarm_actions
    }

    cluster_writes_blocked = {
      alarm_name        = "${aws_opensearch_domain.this.domain_name}_cluster_writes_blocked"
      alarm_description = "${aws_opensearch_domain.this.domain_name} is blocking write requests"

      comparison_operator = "GreaterThanOrEqualToThreshold"
      evaluation_periods  = 1
      threshold           = 1
      period              = 5 * local.minute

      namespace          = "ES/OpenSearchService"
      metric_name        = "ClusterIndexWritesBlocked"
      statistic          = "Maximum"
      treat_missing_data = "notBreaching"

      dimensions = {
        DomainName = aws_opensearch_domain.this.domain_name
      }
      alarm_actions = var.alarm_actions
    }

    unreachable_nodes = {
      alarm_name        = "${aws_opensearch_domain.this.domain_name}_unreachable_nodes"
      alarm_description = "at least one node in your cluster has been unreachable for one day"

      comparison_operator = "GreaterThanOrEqualToThreshold"
      evaluation_periods  = 1
      threshold           = 1
      period              = 60 * local.minute * 24

      namespace          = "ES/OpenSearchService"
      metric_name        = "Nodes"
      statistic          = "Maximum"
      treat_missing_data = "notBreaching"

      dimensions = {
        DomainName = aws_opensearch_domain.this.domain_name
      }
      alarm_actions = var.alarm_actions
    }
    # /cluster status

    # cpu utilization
    data_high_cpu_utilization = {
      alarm_name        = "${aws_opensearch_domain.this.domain_name}_data_high_cpu_util"
      alarm_description = "high cpu utilization on aos data nodes"

      comparison_operator = "GreaterThanOrEqualToThreshold"
      evaluation_periods  = 3
      threshold           = 80
      period              = 15 * local.minute
      unit                = "Percent"

      namespace          = "ES/OpenSearchService"
      metric_name        = "CPUUtilization"
      statistic          = "Maximum"
      treat_missing_data = "notBreaching"

      dimensions = {
        DomainName = aws_opensearch_domain.this.domain_name
      }
      alarm_actions = var.alarm_actions
    }

    master_high_cpu_utilization = {
      alarm_name        = "${aws_opensearch_domain.this.domain_name}_master_high_cpu_util"
      alarm_description = "high cpu utilization on aos master nodes"

      comparison_operator = "GreaterThanOrEqualToThreshold"
      evaluation_periods  = 3
      threshold           = 80
      period              = 15 * local.minute
      unit                = "Percent"

      namespace          = "ES/OpenSearchService"
      metric_name        = "MasterCPUUtilization"
      statistic          = "Maximum"
      treat_missing_data = "notBreaching"

      dimensions = {
        DomainName = aws_opensearch_domain.this.domain_name
      }
      alarm_actions = var.alarm_actions
    }

    warm_high_cpu_utilization = {
      create            = var.warm_instance_count != null
      alarm_name        = "${aws_opensearch_domain.this.domain_name}_warm_high_cpu_util"
      alarm_description = "high cpu utilization on aos warm nodes"

      comparison_operator = "GreaterThanOrEqualToThreshold"
      evaluation_periods  = 3
      threshold           = 80
      period              = 15 * local.minute
      unit                = "Percent"

      namespace          = "ES/OpenSearchService"
      metric_name        = "WarmCPUUtilization"
      statistic          = "Maximum"
      treat_missing_data = "notBreaching"

      dimensions = {
        DomainName = aws_opensearch_domain.this.domain_name
      }
      alarm_actions = var.alarm_actions
    }
    # /cpuutilization

    # jvm pressure
    data_high_jvm_pressure = {
      alarm_name        = "${aws_opensearch_domain.this.domain_name}_data_high_jvm_pressure"
      alarm_description = "high jvm_pressure on aos data nodes"

      comparison_operator = "GreaterThanOrEqualToThreshold"
      evaluation_periods  = 3
      threshold           = 95
      period              = 15 * local.minute
      unit                = "Percent"

      namespace          = "ES/OpenSearchService"
      metric_name        = "JVMMemoryPressure"
      statistic          = "Maximum"
      treat_missing_data = "notBreaching"

      dimensions = {
        DomainName = aws_opensearch_domain.this.domain_name
      }
      alarm_actions = var.alarm_actions
    }

    data_high_oldjvm_pressure = {
      alarm_name        = "${aws_opensearch_domain.this.domain_name}_data_high_oldgenjvm_pressure"
      alarm_description = "high old gen jvm pressure on aos warm nodes"

      comparison_operator = "GreaterThanOrEqualToThreshold"
      evaluation_periods  = 3
      threshold           = 95
      period              = 15 * local.minute
      unit                = "Percent"

      namespace          = "ES/OpenSearchService"
      metric_name        = "OldGenJVMMemoryPressure"
      statistic          = "Maximum"
      treat_missing_data = "notBreaching"

      dimensions = {
        DomainName = aws_opensearch_domain.this.domain_name
      }
      alarm_actions = var.alarm_actions
    }

    master_high_jvm_pressure = {
      alarm_name        = "${aws_opensearch_domain.this.domain_name}_master_high_jvm_pressure"
      alarm_description = "high jvm_pressure on aos master nodes"

      comparison_operator = "GreaterThanOrEqualToThreshold"
      evaluation_periods  = 3
      threshold           = 95
      period              = 15 * local.minute
      unit                = "Percent"

      namespace          = "ES/OpenSearchService"
      metric_name        = "MasterJVMMemoryPressure"
      statistic          = "Maximum"
      treat_missing_data = "notBreaching"

      dimensions = {
        DomainName = aws_opensearch_domain.this.domain_name
      }
      alarm_actions = var.alarm_actions
    }

    master_high_oldjvm_pressure = {
      alarm_name        = "${aws_opensearch_domain.this.domain_name}_master_high_oldgenjvm_pressure"
      alarm_description = "high old gen jvm pressure on aos master nodes"

      comparison_operator = "GreaterThanOrEqualToThreshold"
      evaluation_periods  = 3
      threshold           = 80
      period              = 60 * local.minute
      unit                = "Percent"

      namespace          = "ES/OpenSearchService"
      metric_name        = "MasterOldGenJVMMemoryPressure"
      statistic          = "Maximum"
      treat_missing_data = "notBreaching"

      dimensions = {
        DomainName = aws_opensearch_domain.this.domain_name
      }
      alarm_actions = var.alarm_actions
    }
    # /jvmpressure

    # kms
    aos_key_error = {
      create            = var.encrypt_kms_key_id != null
      alarm_name        = "${aws_opensearch_domain.this.domain_name}_aos_key_error"
      alarm_description = "the AWS KMS encryption key that is used to encrypt data at rest in your domain is disabled"

      comparison_operator = "GreaterThanOrEqualToThreshold"
      evaluation_periods  = 1
      threshold           = 1
      period              = 1 * local.minute
      unit                = "Percent"

      namespace          = "ES/OpenSearchService"
      metric_name        = "KMSKeyError"
      statistic          = "Maximum"
      treat_missing_data = "notBreaching"

      dimensions = {
        DomainName = aws_opensearch_domain.this.domain_name
      }
      alarm_actions = var.alarm_actions
    }

    aos_key_inaccessible = {
      create            = var.encrypt_kms_key_id != null
      alarm_name        = "${aws_opensearch_domain.this.domain_name}_aos_key_inaccessible"
      alarm_description = "the AWS KMS encryption key that is used to encrypt data at rest in your domain has been deleted or has revoked its grants to OpenSearch Service"

      comparison_operator = "GreaterThanOrEqualToThreshold"
      evaluation_periods  = 1
      threshold           = 1
      period              = 1 * local.minute
      unit                = "Percent"

      namespace          = "ES/OpenSearchService"
      metric_name        = "KMSKeyInaccessible"
      statistic          = "Maximum"
      treat_missing_data = "notBreaching"

      dimensions = {
        DomainName = aws_opensearch_domain.this.domain_name
      }
      alarm_actions = var.alarm_actions
    }

    # 5xx errors
    server_errors = {
      alarm_name        = "${aws_opensearch_domain.this.domain_name}_server_errors"
      alarm_description = "One or more data nodes might be overloaded, or requests are failing to complete within the idle timeout period"

      comparison_operator = "GreaterThanOrEqualToThreshold"
      evaluation_periods  = 1
      threshold           = 3
      period              = 10 * local.minute

      namespace          = "ES/OpenSearchService"
      metric_name        = "5xx"
      statistic          = "Maximum"
      treat_missing_data = "notBreaching"

      dimensions = {
        DomainName = aws_opensearch_domain.this.domain_name
      }
      alarm_actions = var.alarm_actions
    }

    # threadpool
    threadpool_high_write_avg = {
      alarm_name        = "${aws_opensearch_domain.this.domain_name}_high_threadpool_write_queue_avg"
      alarm_description = "the cluster is experiencing high indexing concurrency"

      comparison_operator = "GreaterThanOrEqualToThreshold"
      evaluation_periods  = 1
      threshold           = 100
      period              = 1 * local.minute

      namespace          = "ES/OpenSearchService"
      metric_name        = "ThreadpoolWriteQueue"
      statistic          = "Average"
      treat_missing_data = "notBreaching"

      dimensions = {
        DomainName = aws_opensearch_domain.this.domain_name
      }
      alarm_actions = var.alarm_actions
    }

    threadpool_high_search_avg = {
      alarm_name        = "${aws_opensearch_domain.this.domain_name}_high_threadpool_search_avg"
      alarm_description = "	The cluster is experiencing high search concurrency. Consider scaling your cluster. You can also increase the search queue size, but increasing it excessively can cause out of memory errors."

      comparison_operator = "GreaterThanOrEqualToThreshold"
      evaluation_periods  = 1
      threshold           = 500
      period              = 1 * local.minute

      namespace          = "ES/OpenSearchService"
      metric_name        = "ThreadpoolSearchQueue"
      statistic          = "Average"
      treat_missing_data = "notBreaching"

      dimensions = {
        DomainName = aws_opensearch_domain.this.domain_name
      }
      alarm_actions = var.alarm_actions
    }

    threadpool_high_search_max = {
      alarm_name        = "${aws_opensearch_domain.this.domain_name}_high_threadpool_search_max"
      alarm_description = "	The cluster is experiencing high search concurrency. Consider scaling your cluster. You can also increase the search queue size, but increasing it excessively can cause out of memory errors."

      comparison_operator = "GreaterThanOrEqualToThreshold"
      evaluation_periods  = 1
      threshold           = 5000
      period              = 1 * local.minute

      namespace          = "ES/OpenSearchService"
      metric_name        = "ThreadpoolSearchQueue"
      statistic          = "Maximum"
      treat_missing_data = "notBreaching"

      dimensions = {
        DomainName = aws_opensearch_domain.this.domain_name
      }
      alarm_actions = var.alarm_actions
    }
  }

  alarms = { for k, v in local.default_alarms : k => merge(v, try(var.alarm_overrides[k], {})) if var.create_alarms && !contains(var.disabled_alarms, k) }
}

module "cloudwatch_alarms" {
  source  = "terraform-aws-modules/cloudwatch/aws//wrappers/metric-alarm"
  version = "~> 5.4.0"

  items = local.alarms
}
