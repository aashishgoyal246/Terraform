# Creating Security group for EC2 Public

resource "aws_security_group" "SG-1" {

  name = "Master-Public"
  description = "This is my master public ssh group"
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

    Name = "Master-Public"

  }

}

resource "aws_security_group" "SG-2" {

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

# Creating Security group for EC2 Private

resource "aws_security_group" "SG-3" {

  name = "SSH-Private"
  description = "This is my private ssh group"
  vpc_id = "${aws_vpc.VPC.id}"
  ingress {

    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${aws_instance.EC2-1.private_ip}/32"]

  }
  egress {

    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {

    Name = "Slave-Private"

  }

}

resource "aws_security_group" "SG-4" {

  name = "Ping-Private"
  description = "This is my private ping group"
  vpc_id = "${aws_vpc.VPC.id}"
  ingress {

    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["${aws_instance.EC2-1.private_ip}/32"]

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
