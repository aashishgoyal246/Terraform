provider "aws" {

  region = "${var.region}"
  version = "~> 2.5"

}

provider "tls" {

  version = "~> 2.1"

}

