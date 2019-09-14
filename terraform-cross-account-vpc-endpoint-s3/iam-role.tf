# Creating policy and role for ec2 to access s3

resource "aws_iam_role" "Role" {
  provider = "aws.peer"
  name = "EC2-S3-Role"
  assume_role_policy = <<EOF
{
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": "sts:AssumeRole",
          "Principal": {
            "AWS": "${data.aws_caller_identity.Peer-1.account_id}"
          },
          "Effect": "Allow",
          "Sid": ""
        }
     ]
}
EOF
}

resource "aws_iam_policy" "Policy" {
  provider = "aws.peer"
  name = "S3-Full-Access"
  description = "This is s3 full access policy"
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

resource "aws_iam_role_policy_attachment" "Role-Policy" {
  provider = "aws.peer"
  role  = "${aws_iam_role.Role.name}"
  policy_arn = "${aws_iam_policy.Policy.arn}"
}

