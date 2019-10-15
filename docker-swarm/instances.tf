# Creating EC2 instance for Public

resource "aws_instance" "EC2-1" {

  ami = "${lookup(var.ec2_ami,var.region)}"
  instance_type = "t2.micro"
  tags = {

    Name = "Master"

  }
  subnet_id = "${aws_subnet.Subnet-1.id}"
  private_ip = "${var.private_ip[0]}"
  vpc_security_group_ids = ["${aws_security_group.SG-1.id}","${aws_security_group.SG-2.id}"]
  key_name = "${aws_key_pair.Key-Pair-1.key_name}"

}
# Creating EC2 instance for Private

resource "aws_instance" "EC2-2" {

  ami = "${lookup(var.ec2_ami,var.region)}"
  instance_type = "t2.micro"
  tags = {

    Name = "Slave"

  }
  subnet_id = "${aws_subnet.Subnet-2.id}"
  private_ip = "${var.private_ip[1]}"
  vpc_security_group_ids = ["${aws_security_group.SG-3.id}","${aws_security_group.SG-4.id}"]
  key_name = "${aws_key_pair.Key-Pair-2.key_name}"

}

