provider "aws" {
  region = "${var.vpc_region}"
  version = "~> 2.25"
}

provider "aws" {
  alias = "peer"
  region = "${var.vpc_peer_region}"
  version = "~> 2.25"
}

provider "tls" {
   version = "~> 2.1"
}
