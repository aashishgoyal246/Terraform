provider "aws" {

  version = "~> 2.25"
  region = "${var.region}"

}

provider "null" {

  version = "~>2.1"

}
