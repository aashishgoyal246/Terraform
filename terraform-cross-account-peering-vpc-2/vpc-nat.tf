# Creating NAT Gateway for us-east-2

resource "aws_nat_gateway" "NAT-1" {
  allocation_id = "${aws_eip.EIP-2.id}"
  subnet_id = "${aws_subnet.Subnet-1.id}"
}

# Creating NAT Gateway for us-west-2

resource "aws_nat_gateway" "NAT-2" {
  provider = "aws.peer"
  allocation_id = "${aws_eip.EIP-4.id}"
  subnet_id = "${aws_subnet.Subnet-4.id}"
}

# Creating NAT Gateway for ap-south-1

resource "aws_nat_gateway" "NAT-3" {
  provider = "aws.cross"
  allocation_id = "${aws_eip.EIP-6.id}"
  subnet_id = "${aws_subnet.Subnet-6.id}"
}

