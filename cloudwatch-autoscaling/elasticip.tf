# Creating Elastic Ip for Public EC2-1

resource "aws_eip" "EIP-1" {

  instance = "${aws_instance.EC2-1.id}"
  vpc = true
  associate_with_private_ip = "${aws_instance.EC2-1.private_ip}"

}

# Creating Elastic Ip for Public EC2-2

resource "aws_eip" "EIP-2" {

  instance = "${aws_instance.EC2-2.id}"
  vpc = true
  associate_with_private_ip = "${aws_instance.EC2-2.private_ip}"

}


