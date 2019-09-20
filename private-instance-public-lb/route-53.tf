# Creating dns entries

resource "aws_route53_zone" "Zone" {

  name = "aashishgoyal.ml"

}

resource "aws_route53_record" "Record" {

  zone_id = "${aws_route53_zone.Zone.zone_id}"
  name = "www.${aws_route53_zone.Zone.name}"
  type = "A"
  alias {
    name                   = "${aws_lb.LB.dns_name}"
    zone_id                = "${aws_lb.LB.zone_id}"
    evaluate_target_health = true
  }
 
}
