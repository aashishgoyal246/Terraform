output "ec2-key" {

  value = "${tls_private_key.TLS.private_key_pem}"

}

output "eip-1" {

  value = "${aws_instance.EC2-1.private_ip}"

}

output "eip-2" {

  value = "${aws_instance.EC2-2.private_ip}"

}

output "eip-3" {

  value = "${aws_instance.EC2-3.private_ip}"

}

