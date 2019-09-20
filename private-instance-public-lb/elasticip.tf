# Creating Elastic Ip for NAT Gateway

resource "aws_eip" "EIP-1" {

  vpc = true
  
}

# Creating Elastic Ip for Public EC2

resource "aws_eip" "EIP-2" {

  instance = "${aws_instance.EC2-3.id}"
  vpc = true
  associate_with_private_ip = "${aws_instance.EC2-3.private_ip}"

}
