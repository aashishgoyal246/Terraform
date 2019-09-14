# Output for us-east-2

output "ec2-key-1" {
  value = "${tls_private_key.TLS-1.private_key_pem}"
}

output "rds-endpoint" {
  value = "${aws_db_instance.My-DB.endpoint}"
}

