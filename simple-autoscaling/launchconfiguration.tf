# Creating launch configuration for instances

resource "aws_launch_configuration" "Conf-1" {

  name = "LC-1"
  image_id = "${aws_ami.AMI-1.id}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.Key-Pair.key_name}"
  security_groups = ["${aws_security_group.SG-1.id}","${aws_security_group.SG-2.id}","${aws_security_group.SG-4.id}"]
  associate_public_ip_address = true

}

resource "aws_launch_configuration" "Conf-2" {

  name = "LC-2"
  image_id = "${aws_ami.AMI-2.id}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.Key-Pair.key_name}"
  security_groups = ["${aws_security_group.SG-1.id}","${aws_security_group.SG-2.id}","${aws_security_group.SG-4.id}"]
  associate_public_ip_address = true

}

