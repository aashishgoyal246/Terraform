# Creating IAM instance profiles

resource "aws_iam_instance_profile" "Profile-1" {
  name = "Profile-1"
  role = "${aws_iam_role.EC2-Assume-Role.name}"
}

# It is where S3 bucket gets created

resource "aws_iam_instance_profile" "Profile-2" {
  provider = "aws.peer"
  name = "Profile-2"
  role = "${aws_iam_role.Role-EC2.name}"
}
