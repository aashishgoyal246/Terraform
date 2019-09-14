provider "aws" {
  region = "${var.vpc_region}"
  access_key = "XXXXXXXXXXXX"
  secret_key = "XXXXXXXXXXXX"
  version = "~> 2.25"
}

provider "aws" {
  alias = "peer"
  access_key = "XXXXXXXXXXXX"
  secret_key = "XXXXXXXXXXXX"
  region = "${var.vpc_peer_region}"
  version = "~> 2.25"
}

provider "tls" {
   version = "~> 2.1"
}

provider "aws" {
  alias = "cross"
  access_key = "YYYYYYYYYYYY"
  secret_key = "YYYYYYYYYYYY"
  region = "${var.vpc_cross_peer_region}"
  version = "~> 2.25"
}
