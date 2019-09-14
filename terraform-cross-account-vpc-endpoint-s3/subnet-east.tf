# Creating Public Subnet for us-east-2

resource "aws_subnet" "Subnet-1" {
  vpc_id = "${aws_vpc.VPC-1.id}"
  cidr_block  = "${var.subnet_cidr[0]}"
  availability_zone = "${data.aws_availability_zones.azs-1.names[0]}"
  tags = {
    Name = "Public-Subnet"
  }
}

# Creating Private Subnets for us-east-2

resource "aws_subnet" "Subnet-2" {
  vpc_id = "${aws_vpc.VPC-1.id}"
  cidr_block = "${var.subnet_cidr[1]}"
  availability_zone = "${data.aws_availability_zones.azs-1.names[1]}"
  tags = {
    Name = "Private-Subnet-1"
  }
}

resource "aws_subnet" "Subnet-3" {
  vpc_id = "${aws_vpc.VPC-1.id}"
  cidr_block  = "${var.subnet_cidr[2]}"
  availability_zone = "${data.aws_availability_zones.azs-1.names[2]}"
  tags = {
    Name = "Private-Subnet-2"
  }
}

