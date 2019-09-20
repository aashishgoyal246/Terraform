# Creating auto scaling group for launch configurations

resource "aws_autoscaling_group" "AS-1" {

  name = "AS-1"
  min_size = 1
  max_size = 2
  default_cooldown = 30
  health_check_grace_period = 60
  launch_configuration = "${aws_launch_configuration.Conf-1.name}"
  vpc_zone_identifier = ["${aws_subnet.Subnet-1.id}"]
  target_group_arns = ["${aws_lb_target_group.TG.arn}"]

}

resource "aws_autoscaling_policy" "ASP-1" {

  name = "ASP-1"
  autoscaling_group_name = "${aws_autoscaling_group.AS-1.name}"
  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 90
  target_tracking_configuration {
  
    predefined_metric_specification {
    
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50

  }

}

resource "aws_autoscaling_group" "AS-2" {

  name = "AS-2"
  min_size = 1
  max_size = 2
  default_cooldown = 30
  health_check_grace_period = 60
  launch_configuration = "${aws_launch_configuration.Conf-2.name}"
  vpc_zone_identifier = ["${aws_subnet.Subnet-2.id}"]
  target_group_arns = ["${aws_lb_target_group.TG.arn}"]

}

resource "aws_autoscaling_policy" "ASP-2" {

  name = "ASP-2"
  autoscaling_group_name = "${aws_autoscaling_group.AS-2.name}"
  policy_type = "TargetTrackingScaling"
  estimated_instance_warmup = 90
  target_tracking_configuration {

    predefined_metric_specification {

      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50

  }

}

