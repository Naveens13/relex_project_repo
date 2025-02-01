# Create Cloud watch metric for CPU utilisation and memory usuage
resource "aws_cloudwatch_metric_alarm" "web_server_cloud_watch" {
  alarm_name                = "web_server_cloud_watch"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = var.cpu_util_evaluation_periods
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = var.cpu_util_period
  statistic                 = "Average"
  threshold                 = var.cpu_util_threshold
  alarm_description         = "Mertic for monitoring CPU Utilization"
  insufficient_data_actions = []

  dimensions = {
    InstanceId = aws_instance.web_server_ec2.id
  }
  alarm_actions = ["arn:aws:automate:${var.aws_region}:ec2:stop"]
}
