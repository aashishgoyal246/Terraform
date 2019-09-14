# Creating Public RT and attaching Internet Gateway to it for ap-south-1

resource "aws_route_table" "RT-Public-3" {
  provider = "aws.cross"
  vpc_id = "${aws_vpc.VPC-3.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.GW-3.id}"
  }
  route {
    cidr_block = "${var.subnet_cidr[4]}"
    gateway_id = "${aws_vpc_peering_connection.Peering-3.id}"
  }
  route {
    cidr_block = "${var.subnet_cidr[1]}"
    gateway_id = "${aws_vpc_peering_connection.Peering-2.id}"
  }
  tags = {
    Name = "Public-RT"
  }
}

# Creating Private RT and attaching NAT Gateway to it for ap-south-1

resource "aws_route_table" "RT-Private-3" {
  provider = "aws.cross"
  vpc_id = "${aws_vpc.VPC-3.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.NAT-3.id}"
  }
  route {
    cidr_block = "${var.subnet_cidr[3]}"
    gateway_id = "${aws_vpc_peering_connection.Peering-3.id}"
  }
  route {
    cidr_block = "${var.subnet_cidr[4]}"
    gateway_id = "${aws_vpc_peering_connection.Peering-3.id}"
  }
  route {
    cidr_block = "${var.subnet_cidr[0]}"
    gateway_id = "${aws_vpc_peering_connection.Peering-2.id}"
  }
  route {
    cidr_block = "${var.subnet_cidr[1]}"
    gateway_id = "${aws_vpc_peering_connection.Peering-2.id}"
  }
  tags = {
    Name = "Private-RT"
  }
}

# Allocating Public subnet to Public RT for ap-south-1

resource "aws_route_table_association" "Public-3" {
  provider = "aws.cross"
  subnet_id = "${aws_subnet.Subnet-6.id}"
  route_table_id = "${aws_route_table.RT-Public-3.id}"
}

# Allocating Private subnet to Private RT for ap-south-1

resource "aws_route_table_association" "Private-3" {
  provider = "aws.cross"
  subnet_id = "${aws_subnet.Subnet-7.id}"
  route_table_id = "${aws_route_table.RT-Private-3.id}"
}


