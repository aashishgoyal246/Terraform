output "ec2-key-1" {

  value = "${tls_private_key.TLS-1.private_key_pem}"

}

output "ec2-key-2" {

  value = "${tls_private_key.TLS-2.private_key_pem}"

}

output "eip-1" {

  value = "${aws_eip.EIP-1.public_ip}"

}

output "eip-2" {

  value = "${aws_eip.EIP-2.public_ip}"

}

