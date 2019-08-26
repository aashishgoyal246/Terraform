# Creating Public Subnet for us-west-2

resource "aws_subnet" "Subnet-4" {
  provider = "aws.peer"
  vpc_id = "${aws_vpc.VPC-2.id}"
  cidr_block  = "${var.subnet_cidr[3]}"
  availability_zone = "${data.aws_availability_zones.azs-2.names[0]}"
  tags = {
    Name = "Public-Subnet"
  }
}

# Creating Private Subnets for us-west-2

resource "aws_subnet" "Subnet-5" {
  provider = "aws.peer"
  vpc_id = "${aws_vpc.VPC-2.id}"
  cidr_block = "${var.subnet_cidr[4]}"
  availability_zone = "${data.aws_availability_zones.azs-2.names[1]}"
  tags = {
    Name = "Private-Subnet-1"
  }
}


