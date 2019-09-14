# Creating Public RT and attaching Internet Gateway to it for us-west-2

resource "aws_route_table" "RT-Public-2" {
  provider = "aws.peer"
  vpc_id = "${aws_vpc.VPC-2.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.GW-2.id}"
  }
  route {
    cidr_block = "${var.subnet_cidr[1]}"
    gateway_id = "${aws_vpc_peering_connection.Peering-1.id}"
  }
  route {
    cidr_block = "${var.subnet_cidr[6]}"
    gateway_id = "${aws_vpc_peering_connection.Peering-3.id}"
  }
  tags = {
    Name = "Public-RT"
  }
}

# Creating Private RT and attaching NAT Gateway to it for us-west-2

resource "aws_route_table" "RT-Private-2" {
  provider = "aws.peer"
  vpc_id = "${aws_vpc.VPC-2.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.NAT-2.id}"
  }
  route {
    cidr_block = "${var.subnet_cidr[0]}"
    gateway_id = "${aws_vpc_peering_connection.Peering-1.id}"
  }
  route {
    cidr_block = "${var.subnet_cidr[1]}"
    gateway_id = "${aws_vpc_peering_connection.Peering-1.id}"
  }
  route {
    cidr_block = "${var.subnet_cidr[5]}"
    gateway_id = "${aws_vpc_peering_connection.Peering-3.id}"
  }
  route {
    cidr_block = "${var.subnet_cidr[6]}"
    gateway_id = "${aws_vpc_peering_connection.Peering-3.id}"
  }
  tags = {
    Name = "Private-RT"
  }
}

# Allocating Public subnet to Public RT for us-west-2

resource "aws_route_table_association" "Public-2" {
  provider = "aws.peer"
  subnet_id = "${aws_subnet.Subnet-4.id}"
  route_table_id = "${aws_route_table.RT-Public-2.id}"
}

# Allocating Private subnet to Private RT for us-west-2

resource "aws_route_table_association" "Private-2" {
  provider = "aws.peer"
  subnet_id = "${aws_subnet.Subnet-5.id}"
  route_table_id = "${aws_route_table.RT-Private-2.id}"
}

