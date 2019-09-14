# Creating Security group for EC2 Public for us-east-2

resource "aws_security_group" "SG-1" {
  name = "SSH-Public"
  description = "This is my public ssh group"
  vpc_id = "${aws_vpc.VPC-1.id}"
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
    Name = "My-SSH-Public"
  }
}

resource "aws_security_group" "SG-2" {
  name = "Ping-Public"
  description = "This is my public ping group"
  vpc_id = "${aws_vpc.VPC-1.id}"
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
    Name = "My-Ping-Public"
  }
}

# Creating Security group for EC2 Private for us-east-2

resource "aws_security_group" "SG-3" {
  name = "SSH-Private"
  description = "This is my private ssh group"
  vpc_id = "${aws_vpc.VPC-1.id}"
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
    cidr_blocks = ["${var.subnet_cidr[3]}"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${var.subnet_cidr[4]}"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "My-SSH-Private"
  }
}

resource "aws_security_group" "SG-4" {
  name  = "Ping-Private"
  description = "This is my private ping group"
  vpc_id = "${aws_vpc.VPC-1.id}"
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
    cidr_blocks = ["${var.subnet_cidr[3]}"]
  }
  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["${var.subnet_cidr[4]}"]
  }
  egress {
    from_port = 0
    to_port  = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "My-Ping-Private"
  }
}

# Creating Security group for RDS

resource "aws_security_group" "SG-5" {
  name = "RDS"
  description = "This is my rds group"
  vpc_id = "${aws_vpc.VPC-1.id}"
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["${var.subnet_cidr[1]}"]
  }
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["${var.subnet_cidr[4]}"]
  }
  tags = {
    Name = "My-Database"
  }
}

