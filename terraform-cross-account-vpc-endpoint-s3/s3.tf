# Creating bucket 

resource "aws_s3_bucket" "Bucket" {

  provider = "aws.peer"
  bucket = "aashish-s3-bucket"
  region = "${var.vpc_peer_region}"

}
