provider "aws" {
  region = "${var.vpc_region}"
  access_key = "XXXXXXXXXXX"
  secret_key = "XXXXXXXXXXX"
  version = "~> 2.25"
}

provider "tls" {
  version = "~> 2.1"
}

# Cross Account 

provider "aws" {
  alias = "peer"
  access_key = "YYYYYYYYYYY"
  secret_key = "YYYYYYYYYYY"
  region = "${var.vpc_peer_region}"
  version = "~> 2.25"
}

