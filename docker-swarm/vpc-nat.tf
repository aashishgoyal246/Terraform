# Creating NAT Gateway

resource "aws_nat_gateway" "NAT" {

  allocation_id = "${aws_eip.EIP-3.id}"
  subnet_id = "${aws_subnet.Subnet-1.id}"

}

