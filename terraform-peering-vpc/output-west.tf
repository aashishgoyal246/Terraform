# Output for us-west-2

output "ec2-key-2" {
  value = "${tls_private_key.TLS-2.private_key_pem}"
}

output "eip-3" {
  value = "${aws_eip.EIP-3.public_ip}"
}

output "Peering-status" {
  value = "${aws_vpc_peering_connection.Peering.accept_status}"
}
