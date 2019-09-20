# Creating Security group for EC2 Private

resource "aws_security_group" "SG-1" {

  name = "SSH-Private"
  description = "This is my private ssh group"
  vpc_id = "${aws_vpc.VPC.id}"
  ingress {

    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.subnet_cidr[0]}"]

  }
  ingress {

    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.subnet_cidr[1]}"]

  }
  egress {

    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {

    Name = "SSH-Private"

  }

}

resource "aws_security_group" "SG-2" {

  name = "Ping-Private"
  description = "This is my private ping group"
  vpc_id = "${aws_vpc.VPC.id}"
  ingress {

    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["${var.subnet_cidr[0]}"]

  }
  ingress {

    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["${var.subnet_cidr[1]}"]

  }
  egress {

    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {

    Name = "Ping-Private"

  }

}

# Creating Security group for Load balancer

resource "aws_security_group" "SG-3" {

  name = "Load-Balancer"
  description = "This is my private lb group"
  vpc_id = "${aws_vpc.VPC.id}"
  ingress {

    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {

    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {

    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {

    Name = "LB"

  }

}

# Creating Security group for Webserver

resource "aws_security_group" "SG-4" {

  name = "WebServer"
  description = "This is my private webserver group"
  vpc_id = "${aws_vpc.VPC.id}"
  ingress {

    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["${var.subnet_cidr[0]}"]

  }
  ingress {

    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["${var.subnet_cidr[1]}"]

  }
  ingress {

    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["${var.subnet_cidr[0]}"]

  }
  ingress {

    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["${var.subnet_cidr[1]}"]

  }
  egress {

    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {

    Name = "Webserver"

  }

}

# Creating Security group for EC2 Public

resource "aws_security_group" "SG-5" {

  name = "SSH-Public"
  description = "This is my public ssh group"
  vpc_id = "${aws_vpc.VPC.id}"
  ingress {

    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {

    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {

    Name = "SSH-Public"

  }

}


resource "aws_security_group" "SG-6" {

  name = "Ping-Public"
  description = "This is my public ping group"
  vpc_id = "${aws_vpc.VPC.id}"
  ingress {

    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {

    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }


tags = {

    Name = "Ping-Public"

  }

}

