resource "aws_iam_user" "User" {

  count = "${length(var.iam_user)}"
  name = "${element(var.iam_user,count.index)}"

}

resource "aws_iam_policy" "Policy" {

  name = "S3ListAllBuckets"
  policy = "${data.aws_iam_policy_document.Policy.json}"

}

resource "aws_iam_user_policy_attachment" "Attach" {

  count = "${length(var.iam_user)}"
  user = "${element(aws_iam_user.User.*.name,count.index)}"
  policy_arn = "${aws_iam_policy.Policy.arn}"

}

