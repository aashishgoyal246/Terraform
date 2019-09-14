# Creating EC2 instance for Public us-east-2

resource "aws_instance" "EC2-1" {
  ami = "${lookup(var.ec2_ami,var.vpc_region)}"
  instance_type = "t2.micro"
  tags = {
    Name = "Public"
  }
  subnet_id = "${aws_subnet.Subnet-1.id}"
  private_ip = "${var.private_ip[0]}"
  vpc_security_group_ids = ["${aws_security_group.SG-1.id}","${aws_security_group.SG-2.id}"]
  key_name = "${aws_key_pair.Key-Pair-1.key_name}"
}

# Creating EC2 instance for Private us-east-2

resource "aws_instance" "EC2-2" {
  ami = "${lookup(var.ec2_ami,var.vpc_region)}"
  instance_type = "t2.micro"
  tags = {
    Name = "Private"
  }
  subnet_id = "${aws_subnet.Subnet-2.id}"
  private_ip = "${var.private_ip[1]}"
  vpc_security_group_ids = ["${aws_security_group.SG-3.id}","${aws_security_group.SG-4.id}"]
  key_name = "${aws_key_pair.Key-Pair-1.key_name}"
}

# Creating EC2 instance for Public us-west-2

resource "aws_instance" "EC2-3" {
  provider = "aws.peer"
  ami = "${lookup(var.ec2_ami,var.vpc_peer_region)}"
  instance_type = "t2.micro"
  tags = {
    Name = "Public"
  }
  subnet_id = "${aws_subnet.Subnet-4.id}"
  private_ip = "${var.private_ip[2]}"
  vpc_security_group_ids = ["${aws_security_group.SG-6.id}","${aws_security_group.SG-7.id}"]
  key_name = "${aws_key_pair.Key-Pair-2.key_name}"
}

# Creating EC2 instance for Private us-west-2

resource "aws_instance" "EC2-4" {
  provider = "aws.peer"
  ami = "${lookup(var.ec2_ami,var.vpc_peer_region)}"
  instance_type = "t2.micro"
  tags = {
    Name = "Private"
  }
  subnet_id = "${aws_subnet.Subnet-5.id}"
  private_ip = "${var.private_ip[3]}"
  vpc_security_group_ids = ["${aws_security_group.SG-8.id}","${aws_security_group.SG-9.id}"]
  key_name = "${aws_key_pair.Key-Pair-2.key_name}"
}

