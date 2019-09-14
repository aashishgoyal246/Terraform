# Output for us-west-2

output "ec2-key-2" {
  value = "${tls_private_key.TLS-2.private_key_pem}"
}

output "s3_bucket_name" {
  value = "${aws_s3_bucket.Bucket.id}"
}

output "s3_bucket_region" {
  value = "${aws_s3_bucket.Bucket.region}"
}
