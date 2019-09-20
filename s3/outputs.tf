output "S3BucketARN" {

  value = "${aws_iam_policy.Policy.arn}"

}

output "Users-ARN" {

  value = "${aws_iam_user.User.*.arn}"

}


