variable "vpc_region" {
  default = "us-east-2"
}

variable "vpc_peer_region" {
  default = "us-west-2"
}

variable "vpc_cidr" {
  default = "10.1.0.0/16"
}

variable "vpc_peer_cidr" {
  default = "10.2.0.0/16"
}

variable "subnet_cidr" {
  type = "list"
  default = ["10.1.0.0/24","10.1.1.0/24","10.1.2.0/24","10.2.0.0/24","10.2.1.0/24"]
}

variable "private_ip" {
  type = "list"
  default = ["10.1.0.25","10.1.1.30","10.2.0.25","10.2.1.30"]
}

data "aws_availability_zones" "azs-1" {}

data "aws_availability_zones" "azs-2" {
  provider = "aws.peer"
}

variable "ec2_ami" {

  type = "map"
  default = {

    us-east-1 = "ami-0b898040803850657"
    us-east-2 = "ami-0d8f6eb4f641ef691"
    us-west-1 = "ami-056ee704806822732"
    us-west-2 = "ami-082b5a644766e0e6f"
    ap-south-1 = "ami-0d2692b6acea72ee6"
    ap-southeast-1 = "ami-01f7527546b557442"
    ap-southeast-2 = "ami-0dc96254d5535925f"
    ap-northeast-1 = "ami-0c3fd0f5d33134a76"
    ap-northeast-2 = "ami-095ca789e0549777d"
    eu-central-1 = "ami-0cc293023f983ed53"
    eu-west-1 = "ami-0bbc25e23a7640b9b"
    eu-west-2 = "ami-0d8e27447ec2c8410"
    eu-west-3 = "ami-0adcddd3324248c4c"
    eu-north-1 = "ami-3f36be41"

  }

}

data "aws_caller_identity" "Peer" {

  provider = "aws.peer"

}

