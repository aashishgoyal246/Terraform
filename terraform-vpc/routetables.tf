# Creating Public RT and attaching Internet Gateway to it

resource "aws_route_table" "RT-Public" {

  vpc_id = "${aws_vpc.VPC.id}"
  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.GW.id}"

  }
  tags = {

    Name = "Public-RT"

  }

}

# Creating Private RT and attaching NAT Gateway to it

resource "aws_route_table" "RT-Private" {

  vpc_id = "${aws_vpc.VPC.id}"
  route {

    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.NAT.id}"

  }
  tags = {

    Name = "Private-RT"

  }

}
# Allocating Public subnet to Public RT

resource "aws_route_table_association" "Public" {

  subnet_id = "${aws_subnet.Subnet-1.id}"
  route_table_id = "${aws_route_table.RT-Public.id}"

}

# Allocating Private subnet to Private RT

resource "aws_route_table_association" "Private-1" {

  subnet_id = "${aws_subnet.Subnet-2.id}"
  route_table_id = "${aws_route_table.RT-Private.id}"

}

resource "aws_route_table_association" "Private-2" {

  subnet_id = "${aws_subnet.Subnet-3.id}"
  route_table_id = "${aws_route_table.RT-Private.id}"

}

