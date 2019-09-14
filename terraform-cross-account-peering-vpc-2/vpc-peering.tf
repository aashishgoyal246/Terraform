# Creating VPC peering between us-east-2 and us-west-2

resource "aws_vpc_peering_connection" "Peering-1" {
  peer_vpc_id = "${aws_vpc.VPC-2.id}"
  vpc_id = "${aws_vpc.VPC-1.id}"
  peer_region = "${var.vpc_peer_region}"
  tags = {
    Name = "Requester-1"
  }
}

resource "aws_vpc_peering_connection_accepter" "Peering-1" {
  provider = "aws.peer"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.Peering-1.id}"
  auto_accept = true
  tags = {
    Name = "Accepter-1"
  }
}

# Creating VPC peering between us-east-2 and ap-south-1

resource "aws_vpc_peering_connection" "Peering-2" {
  peer_vpc_id = "${aws_vpc.VPC-3.id}"
  vpc_id = "${aws_vpc.VPC-1.id}"
  peer_region = "${var.vpc_cross_peer_region}"
  peer_owner_id = "${data.aws_caller_identity.Peer.account_id}"
  tags = {
    Name = "Requester-2"
  }
}

resource "aws_vpc_peering_connection_accepter" "Peering-2" {
  provider = "aws.cross"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.Peering-2.id}"
  auto_accept = true
  tags = {
    Name = "Accepter-2"
  }
}

# Creating VPC peering between us-west-2 and ap-south-1

resource "aws_vpc_peering_connection" "Peering-3" {
  
  provider = "aws.peer"
  peer_vpc_id = "${aws_vpc.VPC-3.id}"
  vpc_id = "${aws_vpc.VPC-2.id}"
  peer_region = "${var.vpc_cross_peer_region}"
  peer_owner_id = "${data.aws_caller_identity.Peer.account_id}"
  tags = {
    Name = "Requester-3"
  }
}

resource "aws_vpc_peering_connection_accepter" "Peering-3" {
  provider = "aws.cross"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.Peering-3.id}"
  auto_accept = true
  tags = {
    Name = "Accepter-3"
  }
}

