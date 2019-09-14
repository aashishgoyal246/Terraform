resource "aws_db_subnet_group" "RDS-SG" {
  name  = "project-db"
  description = "This is my rds subnet group for my project"
  subnet_ids  = ["${aws_subnet.Subnet-2.id}","${aws_subnet.Subnet-3.id}"]
}

