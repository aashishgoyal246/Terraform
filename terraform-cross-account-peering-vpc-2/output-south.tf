# Output for ap-south-1

output "ec2-key-3" {
  value = "${tls_private_key.TLS-3.private_key_pem}"
}

