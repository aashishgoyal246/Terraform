# Creating Elastic Ip for Public EC2 for us-east-2

resource "aws_eip" "EIP-1" {
  instance = "${aws_instance.EC2-1.id}"
  vpc = true
  associate_with_private_ip = "${aws_instance.EC2-1.private_ip}"
}

# Creating Elastic Ip for NAT Gateway for us-east-2

resource "aws_eip" "EIP-2" {
  vpc = true
}

# Creating Elastic Ip for Public EC2 for us-west-2

resource "aws_eip" "EIP-3" {
  provider = "aws.peer"
  instance = "${aws_instance.EC2-3.id}"
  vpc = true
  associate_with_private_ip = "${aws_instance.EC2-3.private_ip}"
}

# Creating Elastic Ip for NAT Gateway for us-west-2

resource "aws_eip" "EIP-4" {
  provider = "aws.peer"
  vpc = true
}

# Creating Elastic Ip for Public EC2 for ap-south-1

resource "aws_eip" "EIP-5" {
  provider = "aws.cross"
  instance = "${aws_instance.EC2-5.id}"
  vpc = true
  associate_with_private_ip = "${aws_instance.EC2-5.private_ip}"
}

# Creating Elastic Ip for NAT Gateway for us-west-2

resource "aws_eip" "EIP-6" {
  provider = "aws.cross"
  vpc = true
}


