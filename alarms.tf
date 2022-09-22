resource "aws_cloudwatch_metric_alarm" "red_cluster_status" {
  alarm_name        = "${aws_opensearch_domain.this.domain_name}-red-cluster-status"
  alarm_description = "At least one primary shard and its replicas are not allocated to a node"

  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.red_cluster_status_evaluation_periods

  metric_name = "ClusterStatus.red"
  namespace   = "AWS/ES"

  period    = var.red_cluster_status_period
  statistic = "Maximum"

  threshold = var.red_cluster_status_threshold

  alarm_actions = var.alarm_actions
  ok_actions    = var.ok_actions

  tags = var.tags

  dimensions = {
    Per-Domain = aws_opensearch_domain.this.domain_name
  }
}
