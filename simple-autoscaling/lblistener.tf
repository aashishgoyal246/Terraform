# Creating listener rule for the load balancer

resource "aws_lb_listener" "Forward" {

  load_balancer_arn = "${aws_lb.LB.arn}"
  port = 80
  protocol = "HTTP"
  default_action {

    type = "forward"
    target_group_arn = "${aws_lb_target_group.TG.arn}"

  }

}
