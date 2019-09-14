provider "aws" {
  
  version = "~> 2.25"
  region = "${var.region}"
  access_key = "XXXXXXXXXX"
  secret_key = "XXXXXXXXXX"

}

provider "tls" {

  version = "~> 2.1"

}
