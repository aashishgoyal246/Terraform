data "aws_iam_policy_document" "Policy" {

  statement {
  
    effect = "Allow"
    actions = ["s3:ListAllMyBuckets"]
    resources = ["*"]

  }

}
