# Creating key pair

resource "tls_private_key" "TLS" {

  algorithm = "RSA"
  rsa_bits  = 4096

}

resource "aws_key_pair" "Key-Pair" {
  key_name   = "test-keypair"
  public_key = "${tls_private_key.TLS.public_key_openssh}"
}
