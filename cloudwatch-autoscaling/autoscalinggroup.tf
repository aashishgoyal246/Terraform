# Creating auto scaling group for launch configurations

resource "aws_autoscaling_group" "AS-1" {

  name = "AS-1"
  min_size = 1
  max_size = 2
  default_cooldown = 60
  health_check_grace_period = 30
  launch_configuration = "${aws_launch_configuration.Conf-1.name}"
  vpc_zone_identifier = ["${aws_subnet.Subnet-1.id}","${aws_subnet.Subnet-2.id}"]
  target_group_arns = ["${aws_lb_target_group.TG.arn}"]

}

resource "aws_autoscaling_policy" "ASP-1" {

  name = "ASP-1"
  autoscaling_group_name = "${aws_autoscaling_group.AS-1.name}"
  scaling_adjustment = 1
  adjustment_type = "ChangeInCapacity" 
  cooldown = 60

}

resource "aws_autoscaling_policy" "ASP-3" {

  name = "ASP-3"
  autoscaling_group_name = "${aws_autoscaling_group.AS-1.name}"
  scaling_adjustment = -1
  adjustment_type = "ChangeInCapacity"
  cooldown = 60

}


resource "aws_autoscaling_group" "AS-2" {

  name = "AS-2"
  min_size = 1
  max_size = 2
  default_cooldown = 60
  health_check_grace_period = 30
  launch_configuration = "${aws_launch_configuration.Conf-2.name}"
  vpc_zone_identifier = ["${aws_subnet.Subnet-1.id}","${aws_subnet.Subnet-2.id}"]
  target_group_arns = ["${aws_lb_target_group.TG.arn}"]

}

resource "aws_autoscaling_policy" "ASP-2" {

  name = "ASP-2"
  autoscaling_group_name = "${aws_autoscaling_group.AS-2.name}"
  scaling_adjustment = 1
  adjustment_type = "ChangeInCapacity"
  cooldown = 60 

}

resource "aws_autoscaling_policy" "ASP-4" {

  name = "ASP-4"
  autoscaling_group_name = "${aws_autoscaling_group.AS-2.name}"
  scaling_adjustment = -1
  adjustment_type = "ChangeInCapacity"
  cooldown = 60

}

resource "aws_cloudwatch_metric_alarm" "Alarm-1" {
  alarm_name = "Alarm-1"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods = "1"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "60"
  statistic = "Average"
  threshold = "25"
 
  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.AS-1.name}"
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions = ["${aws_autoscaling_policy.ASP-1.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "Alarm-2" {
  alarm_name = "Alarm-2"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods = "1"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "60"
  statistic = "Average"
  threshold = "25"
  
  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.AS-2.name}"
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions = ["${aws_autoscaling_policy.ASP-2.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "Alarm-3" {
  alarm_name = "Alarm-3"
  comparison_operator = "LessThanThreshold"
  evaluation_periods = "1"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "60"
  statistic = "Average"
  threshold = "25"

  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.AS-2.name}"
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions = ["${aws_autoscaling_policy.ASP-3.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "Alarm-4" {
  alarm_name = "Alarm-4"
  comparison_operator = "LessThanThreshold"
  evaluation_periods = "1"
  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "60"
  statistic = "Average"
  threshold = "25"

  dimensions = {
    AutoScalingGroupName = "${aws_autoscaling_group.AS-2.name}"
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions = ["${aws_autoscaling_policy.ASP-4.arn}"]
}

