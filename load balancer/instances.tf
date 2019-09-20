# Creating EC2 instance for Public

resource "aws_instance" "EC2-1" {

  ami = "${lookup(var.ec2_ami,var.region)}"
  instance_type = "t2.micro"
  tags = {

    Name = "Public-1"

  }
  subnet_id = "${aws_subnet.Subnet-1.id}"
  private_ip = "${var.private_ip[0]}"
  vpc_security_group_ids = ["${aws_security_group.SG-1.id}","${aws_security_group.SG-2.id}","${aws_security_group.SG-4.id}"]
  key_name = "${aws_key_pair.Key-Pair.key_name}"
  user_data = "#!/bin/bash\n\nyum update -y\nyum install -y httpd*\nsystemctl start httpd\nsystemctl enable httpd\necho 'Welcome to Oregon Page 1' > /var/www/html/index.html\nsystemctl restart httpd" 

}

resource "aws_instance" "EC2-2" {

  ami = "${lookup(var.ec2_ami,var.region)}"
  instance_type = "t2.micro"
  tags = {

    Name = "Public-2"

  }
  subnet_id = "${aws_subnet.Subnet-1.id}"
  private_ip = "${var.private_ip[1]}"
  vpc_security_group_ids = ["${aws_security_group.SG-1.id}","${aws_security_group.SG-2.id}","${aws_security_group.SG-4.id}"]
  key_name = "${aws_key_pair.Key-Pair.key_name}"
  user_data = "#!/bin/bash\n\nyum update -y\nyum install -y httpd*\nsystemctl start httpd\nsystemctl enable httpd\necho 'Welcome to Oregon Page 2' > /var/www/html/index.html\nsystemctl restart httpd"

}

