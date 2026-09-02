# Define the Route 53 hosted zone for the domain
resource "aws_route53_zone" "zone_1" {
  name = var.zone_1_name
}

# Define an A record for the apex that maps to the server IP
resource "aws_route53_record" "zone_1_apex" {
  zone_id = aws_route53_zone.zone_1.zone_id
  name    = var.zone_1_name
  type    = "A"
  ttl     = 300

  records = [var.zone_1_apex_ip]

  depends_on = [aws_route53_zone.zone_1]
}

# Define a CNAME record for the www subdomain that maps to the apex
resource "aws_route53_record" "zone_1_www" {
  zone_id = aws_route53_zone.zone_1.zone_id
  name    = "www.${var.zone_1_name}"
  type    = "CNAME"
  ttl     = 300

  records = [var.zone_1_name]

  depends_on = [aws_route53_zone.zone_1]
}
