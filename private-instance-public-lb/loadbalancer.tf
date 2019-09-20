# Creating Application Load Balancer in 2 Public Subnets

resource "aws_lb" "LB" {

  name = "WebServer"
  subnets = ["${aws_subnet.Subnet-1.id}","${aws_subnet.Subnet-2.id}"]
  security_groups = ["${aws_security_group.SG-3.id}"]
  internal = false
  tags = {

    Name = "WebServer-LB"
  
  }
  load_balancer_type = "application"

}

