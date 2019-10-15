variable "region" {

  default = "us-east-2"

}

variable "vpc_cidr" {

  default = "10.1.0.0/16"

}

variable "subnet_cidr" {

  type = "list"
  default = ["10.1.0.0/24","10.1.1.0/24"]

}

data "aws_availability_zones" "azs" {}

variable "private_ip" {

  type = "list"
  default = ["10.1.0.25","10.1.1.30"]

}

variable "ec2_ami" {

  type = "map"
  default = {

    us-east-1 = "ami-04b9e92b5572fa0d1"
    us-east-2 = "ami-0d5d9d301c853a04a"
    ap-south-1 = "ami-0123b531fc646552f"

  } 

}
