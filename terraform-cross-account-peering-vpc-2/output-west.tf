# Output for us-west-2

output "ec2-key-2" {
  value = "${tls_private_key.TLS-2.private_key_pem}"
}

