# Creating target group for load balancer

resource "aws_lb_target_group" "TG" {

  name = "LB-TG"
  port = 80
  protocol = "HTTP"
  vpc_id = "${aws_vpc.VPC.id}"
  target_type = "instance"
  health_check {

  enabled = true
  path = "/"

  }
  
}

# Attachment of TG

resource "aws_lb_target_group_attachment" "TGA-1" {

  target_group_arn = "${aws_lb_target_group.TG.arn}"
  target_id = "${aws_instance.EC2-1.id}"
  port = 80

}

resource "aws_lb_target_group_attachment" "TGA-2" {

  target_group_arn = "${aws_lb_target_group.TG.arn}"
  target_id = "${aws_instance.EC2-2.id}"
  port = 80

}
