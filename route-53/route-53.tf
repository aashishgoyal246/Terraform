# Creating dns entries

resource "aws_route53_zone" "Zone" {

  name = "aashishgoyal.ml"

}

resource "aws_route53_health_check" "Health-Check-1" {
  
  port = 80
  ip_address = "${aws_eip.EIP-1.public_ip}"
  type = "HTTP"
  resource_path = "/"
  failure_threshold = "5"
  request_interval = "30"
  tags = {
    Name = "Health-1"
  }

}

resource "aws_route53_record" "Record-1" {

  zone_id = "${aws_route53_zone.Zone.zone_id}"
  name = "www.${aws_route53_zone.Zone.name}"
  type = "A"
  ttl = "60"
  records = ["${aws_eip.EIP-1.public_ip}"]
  health_check_id = "${aws_route53_health_check.Health-Check-1.id}"
  weighted_routing_policy {
    weight = 70
  }
  set_identifier = "Oregon-1"

}

resource "aws_route53_health_check" "Health-Check-2" {

  port = 80
  ip_address = "${aws_eip.EIP-2.public_ip}"
  type = "HTTP"
  resource_path = "/"
  failure_threshold = "5"
  request_interval = "30"
  tags = {
    Name = "Health-2"
  }

}

resource "aws_route53_record" "Record-2" {

  zone_id = "${aws_route53_zone.Zone.zone_id}"
  name = "www.${aws_route53_zone.Zone.name}"
  type = "A"
  ttl = "60"
  records = ["${aws_eip.EIP-2.public_ip}"]
  health_check_id = "${aws_route53_health_check.Health-Check-2.id}"
  weighted_routing_policy {
    weight = 30
  }
  set_identifier = "Oregon-2"

}

