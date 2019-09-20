# Creating EC2 instance in Private Subnets

resource "aws_instance" "EC2-1" {

  ami = "${lookup(var.ec2_ami,var.region)}"
  instance_type = "t2.micro"
  tags = {

    Name = "Private-1"

  }
  subnet_id = "${aws_subnet.Subnet-2.id}"
  private_ip = "${var.private_ip[0]}"
  vpc_security_group_ids = ["${aws_security_group.SG-1.id}","${aws_security_group.SG-2.id}","${aws_security_group.SG-4.id}"]
  key_name = "${aws_key_pair.Key-Pair.key_name}"

}


resource "aws_instance" "EC2-2" {

  ami = "${lookup(var.ec2_ami,var.region)}"
  instance_type = "t2.micro"
  tags = {

    Name = "Private-2"

  }
  subnet_id = "${aws_subnet.Subnet-2.id}"
  private_ip = "${var.private_ip[1]}"
  vpc_security_group_ids = ["${aws_security_group.SG-1.id}","${aws_security_group.SG-2.id}","${aws_security_group.SG-4.id}"]
  key_name = "${aws_key_pair.Key-Pair.key_name}"

}

resource "aws_instance" "EC2-3" {

  ami = "${lookup(var.ec2_ami,var.region)}"
  instance_type = "t2.micro"
  tags = {

    Name = "Public"

  }
  subnet_id = "${aws_subnet.Subnet-1.id}"
  private_ip = "${var.private_ip[2]}"
  vpc_security_group_ids = ["${aws_security_group.SG-5.id}","${aws_security_group.SG-6.id}"]
  key_name = "${aws_key_pair.Key-Pair.key_name}"

}

