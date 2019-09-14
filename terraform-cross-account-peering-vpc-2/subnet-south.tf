# Creating Public Subnet for ap-south-1

resource "aws_subnet" "Subnet-6" {
  provider = "aws.cross"
  vpc_id = "${aws_vpc.VPC-3.id}"
  cidr_block  = "${var.subnet_cidr[5]}"
  availability_zone = "${data.aws_availability_zones.azs-3.names[0]}"
  tags = {
    Name = "Public-Subnet"
  }
}

# Creating Private Subnets for ap-south-1

resource "aws_subnet" "Subnet-7" {
  provider = "aws.cross"
  vpc_id = "${aws_vpc.VPC-3.id}"
  cidr_block = "${var.subnet_cidr[6]}"
  availability_zone = "${data.aws_availability_zones.azs-3.names[1]}"
  tags = {
    Name = "Private-Subnet"
  }
}


