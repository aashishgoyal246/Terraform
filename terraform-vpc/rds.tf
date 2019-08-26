resource "aws_db_instance" "My-DB" {

  engine = "mysql"
  engine_version = "5.7"
  identifier = "project-db"
  username = "project"
  password = "project-123"
  instance_class = "db.t2.micro"
  storage_type = "gp2"
  allocated_storage = 20
  name = "project"
  db_subnet_group_name = "${aws_db_subnet_group.RDS-SG.name}"
  vpc_security_group_ids = ["${aws_security_group.SG-5.id}"]
  availability_zone = "${data.aws_availability_zones.azs.names[1]}"
  port = 3306
  auto_minor_version_upgrade = false
  publicly_accessible = false
  skip_final_snapshot = true

}
