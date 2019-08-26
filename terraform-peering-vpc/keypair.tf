# Creating key pair for us-east-2

resource "tls_private_key" "TLS-1" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "Key-Pair-1" {
  key_name = "test-keypair"
  public_key = "${tls_private_key.TLS-1.public_key_openssh}"
}

# Creating key pair for us-west-2

resource "tls_private_key" "TLS-2" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "Key-Pair-2" {
  provider = "aws.peer"
  key_name = "test-keypair"
  public_key = "${tls_private_key.TLS-2.public_key_openssh}"
}

