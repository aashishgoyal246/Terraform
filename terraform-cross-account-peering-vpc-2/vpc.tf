# Creating VPC for us-east-2

resource "aws_vpc" "VPC-1" {
  cidr_block = "${var.vpc_cidr}"
  tags = {
    Name = "My-VPC"
  }
}

# Creating VPC for us-west-2

resource "aws_vpc" "VPC-2" {
  provider = "aws.peer"
  cidr_block = "${var.vpc_peer_cidr}"
  tags = {
    Name = "My-VPC"
  }
}

# Creating VPC for ap-south-1

resource "aws_vpc" "VPC-3" {
  provider = "aws.cross"
  cidr_block = "${var.vpc_cross_peer_cidr}"
  tags = {
    Name = "My-VPC"
  }
}

