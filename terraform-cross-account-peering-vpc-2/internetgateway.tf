# Creating Internet Gateway for the VPC us-east-2

resource "aws_internet_gateway" "GW-1" {
  vpc_id = "${aws_vpc.VPC-1.id}"
  tags = {
    Name = "My-IG"
  }
}

# Creating Internet Gateway for the VPC us-west-2

resource "aws_internet_gateway" "GW-2" {
  provider = "aws.peer"
  vpc_id = "${aws_vpc.VPC-2.id}"
  tags = {
    Name = "My-IG"
  }
}

# Creating Internet Gateway for the VPC ap-south-1

resource "aws_internet_gateway" "GW-3" {
  provider = "aws.cross"
  vpc_id = "${aws_vpc.VPC-3.id}"
  tags = {
    Name = "My-IG"
  }
}

