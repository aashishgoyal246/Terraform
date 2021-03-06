# Creating Public Subnet-1

resource "aws_subnet" "Subnet-1" {

  vpc_id = "${aws_vpc.VPC.id}"
  cidr_block = "${var.subnet_cidr[0]}"
  availability_zone = "${data.aws_availability_zones.azs.names[0]}"
  tags = {

    Name = "Public-Subnet-1"

  }

}

# Creating Private Subnet-1

resource "aws_subnet" "Subnet-2" {

  vpc_id = "${aws_vpc.VPC.id}"
  cidr_block = "${var.subnet_cidr[1]}"
  availability_zone = "${data.aws_availability_zones.azs.names[1]}"
  tags = {

    Name = "Private-Subnet-1"

 }

}

