provider "aws" {

  region = "${var.region}"
  version = "~> 2.5"

}

provider "tls" {

  version = "~> 2.1"

}

provider "null" {

  version = "~> 2.1"

}
