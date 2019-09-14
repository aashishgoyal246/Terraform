# Creating assume role for us-east-2 

resource "aws_iam_role" "EC2-Assume-Role" {
  name = "EC2-Assume-Role"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com",
               "AWS": "${aws_iam_role.Role.arn}"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_policy" "Assume-Role" {
  name = "Assume-Role-EC2"
  description = "This is for assuming role"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "${aws_iam_role.Role.arn}"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "Assume-Policy-Attach" {
  role  = "${aws_iam_role.EC2-Assume-Role.name}"
  policy_arn = "${aws_iam_policy.Assume-Role.arn}"
}

