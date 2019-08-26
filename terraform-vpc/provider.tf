provider "aws" {
  
  version = "~> 2.25"
  region = "${var.region}"

}

provider "tls" {

  version = "~> 2.1"

}
