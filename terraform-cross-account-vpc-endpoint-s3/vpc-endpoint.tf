# Creating endpoint for s3

resource "aws_vpc_endpoint" "S3" {
  provider = "aws.peer"
  vpc_id = "${aws_vpc.VPC-2.id}"
  service_name = "com.amazonaws.us-west-2.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids = ["${aws_route_table.RT-Private-2.id}"]
  policy = <<POLICY
{
    "Statement": [
        {
            "Action": "*",
            "Effect": "Allow",
            "Resource": "*",
            "Principal": "*"
        }
    ]
}
POLICY
}
