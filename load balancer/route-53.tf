# Creating dns entries

resource "aws_route53_zone" "Zone" {

  name = "aashishgoyal.ml"

}

resource "aws_route53_record" "Record-1" {

  zone_id = "${aws_route53_zone.Zone.zone_id}"
  name = "www.${aws_route53_zone.Zone.name}"
  type = "A"
  ttl = "60"
  records = ["${aws_eip.EIP-1.public_ip}"]
  
}

resource "aws_route53_record" "Record-2" {

  zone_id = "${aws_route53_zone.Zone.zone_id}"
  name = "www.${aws_route53_zone.Zone.name}"
  type = "A"
  ttl = "60"
  records = ["${aws_eip.EIP-2.public_ip}"]
  
}