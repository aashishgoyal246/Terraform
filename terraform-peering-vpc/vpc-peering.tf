# Creating VPC peering between us-east-2 and us-west-2

resource "aws_vpc_peering_connection" "Peering" {
  peer_vpc_id = "${aws_vpc.VPC-2.id}"
  vpc_id = "${aws_vpc.VPC-1.id}"
  peer_region = "${var.vpc_peer_region}"
  tags = {
    Name = "Requester"
  }
}

resource "aws_vpc_peering_connection_accepter" "Peering" {
  provider = "aws.peer"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.Peering.id}"
  auto_accept = true
  tags = {
    Name = "Accepter"
  }
}
