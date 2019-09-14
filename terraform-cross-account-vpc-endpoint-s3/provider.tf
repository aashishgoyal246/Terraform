provider "aws" {
  region = "${var.vpc_region}"
  access_key = "XXXXXXXXX"
  secret_key = "XXXXXXXXX"
  version = "~> 2.25"
}

provider "tls" {
  version = "~> 2.1"
}

# Cross Account 

provider "aws" {
  alias = "peer"
  access_key = "YYYYYYYYY"
  secret_key = "YYYYYYYYY"
  region = "${var.vpc_peer_region}"
  version = "~> 2.25"
}

