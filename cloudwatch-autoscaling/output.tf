output "ec2-key" {

  value = "${tls_private_key.TLS.private_key_pem}"

}

output "eip-1" {

  value = "${aws_eip.EIP-1.public_ip}"

}

output "eip-2" {

  value = "${aws_eip.EIP-2.public_ip}"

}

output "ami_id_1" {

  value = "${aws_ami.AMI-1.id}"

}

output "ami_id_2" {

  value = "${aws_ami.AMI-2.id}"

}
