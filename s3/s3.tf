resource "aws_s3_bucket" "Bucket" {

  bucket = "aashishs3bucket"
  region = "${var.region}"

}

resource "aws_s3_bucket_policy" "Policy" {

  bucket = "${aws_s3_bucket.Bucket.id}"
  
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "Policy",
  "Statement": [
    {
      "Sid": "Policy-1",
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "${aws_iam_user.User.0.arn}"
        ]
      },
      "Action": [
        "s3:DeleteObject",
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Resource": "${aws_s3_bucket.Bucket.arn}/*"
    },
    {
      "Sid": "Policy-2",
      "Effect": "Allow",
      "Principal": {
        "AWS": [
          "${aws_iam_user.User.0.arn}"
        ]
      },
      "Action": [
        "s3:ListBucket"
      ],
      "Resource": "${aws_s3_bucket.Bucket.arn}"
    }
  ]
}
POLICY

}

