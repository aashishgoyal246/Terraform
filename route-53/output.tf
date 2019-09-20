output "ec2-key" {

  value = "${tls_private_key.TLS.private_key_pem}"

}

