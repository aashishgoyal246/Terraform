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

# Allocating Public subnets to Public RT

resource "aws_route_table_association" "Public-1" {

  subnet_id = "${aws_subnet.Subnet-1.id}"
  route_table_id = "${aws_route_table.RT-Public.id}"

}

resource "aws_route_table_association" "Public-2" {

  subnet_id = "${aws_subnet.Subnet-2.id}"
  route_table_id = "${aws_route_table.RT-Public.id}"

}

