output "ec2-key" {

  value = "${tls_private_key.TLS.private_key_pem}"

}

output "eip" {

  value = "${aws_eip.EIP-1.public_ip}"

}

output "rds" {

  value = "${aws_db_instance.My-DB.endpoint}"

}
