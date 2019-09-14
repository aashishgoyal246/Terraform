# Creating Public RT and attaching Internet Gateway to it for us-east-2

resource "aws_route_table" "RT-Public-1" {
  vpc_id = "${aws_vpc.VPC-1.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.GW-1.id}"
  }
  route {
    cidr_block = "${var.subnet_cidr[4]}"
    gateway_id = "${aws_vpc_peering_connection_accepter.Peering-1.id}"
  }
  route {
    cidr_block = "${var.subnet_cidr[6]}"
    gateway_id = "${aws_vpc_peering_connection_accepter.Peering-2.id}"
  }
  tags = {
    Name = "Public-RT"
  }
}

# Creating Private RT and attaching NAT Gateway to it for us-east-2

resource "aws_route_table" "RT-Private-1" {
  vpc_id = "${aws_vpc.VPC-1.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.NAT-1.id}"
  }
  route {
    cidr_block = "${var.subnet_cidr[3]}"
    gateway_id = "${aws_vpc_peering_connection_accepter.Peering-1.id}"
  }
  route {
    cidr_block = "${var.subnet_cidr[4]}"
    gateway_id = "${aws_vpc_peering_connection_accepter.Peering-1.id}"
  }
  route {
    cidr_block = "${var.subnet_cidr[5]}"
    gateway_id = "${aws_vpc_peering_connection_accepter.Peering-2.id}"
  }
  route {
    cidr_block = "${var.subnet_cidr[6]}"
    gateway_id = "${aws_vpc_peering_connection_accepter.Peering-2.id}"
  }
  tags = {
    Name = "Private-RT"
  }
}

# Allocating Public subnet to Public RT for us-east-2

resource "aws_route_table_association" "Public-1" {
  subnet_id = "${aws_subnet.Subnet-1.id}"
  route_table_id = "${aws_route_table.RT-Public-1.id}"
}

# Allocating Private subnet to Private RT for us-east-2

resource "aws_route_table_association" "Private-1-1" {
  subnet_id = "${aws_subnet.Subnet-2.id}"
  route_table_id = "${aws_route_table.RT-Private-1.id}"
}

resource "aws_route_table_association" "Private-1-2" {
  subnet_id = "${aws_subnet.Subnet-3.id}"
  route_table_id = "${aws_route_table.RT-Private-1.id}"
}

