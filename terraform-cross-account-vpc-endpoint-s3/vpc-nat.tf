# Creating NAT Gateway for us-east-2

resource "aws_nat_gateway" "NAT-1" {
  allocation_id = "${aws_eip.EIP-2.id}"
  subnet_id = "${aws_subnet.Subnet-1.id}"
}
