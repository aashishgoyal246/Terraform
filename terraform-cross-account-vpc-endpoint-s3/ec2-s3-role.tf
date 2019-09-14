# Creating policy and role for ec2 to access s3

resource "aws_iam_role" "Role-EC2" {
  provider = "aws.peer"
  name = "EC2-S3-Role-Own-Account"
  assume_role_policy = <<EOF
{
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "Service": "ec2.amazonaws.com"
          },
          "Effect": "Allow",
          "Sid": ""
        }
     ]
}
EOF
}

resource "aws_iam_policy" "Policy-EC2" {
  provider = "aws.peer"
  name = "S3-Full-Access-Own-Account"
  description = "This is s3 full access policy for own account"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "Role-Policy-EC2-S3" {
  provider = "aws.peer"
  role  = "${aws_iam_role.Role-EC2.name}"
  policy_arn = "${aws_iam_policy.Policy-EC2.arn}"
}

