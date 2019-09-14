provider "aws" {
  
  version = "~> 2.25"
  region = "${var.region}"
  access_key = "AKIAVJ6BG5CBN5DJVY5R"
  secret_key = "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"

}

provider "tls" {

  version = "~> 2.1"

}
