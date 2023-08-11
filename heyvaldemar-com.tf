# Define the Route 53 hosted zone for the domain
resource "aws_route53_zone" "heyvaldemar_com" {
  name = "heyvaldemar.com"
}

# Define an A record for the domain that maps to the IP address
resource "aws_route53_record" "heyvaldemar_com" {
  zone_id = aws_route53_zone.heyvaldemar_com.zone_id
  name    = "heyvaldemar.com"
  type    = "A"
  ttl     = 300

  records = ["127.0.0.1"]

  depends_on = [aws_route53_zone.heyvaldemar_com]
}

# Define a CNAME record for the subdomain that maps to another domain
resource "aws_route53_record" "www_heyvaldemar_com" {
  zone_id = aws_route53_zone.heyvaldemar_com.zone_id
  name    = "www.heyvaldemar.com"
  type    = "CNAME"
  ttl     = 300

  records = ["heyvaldemar.com"]

  depends_on = [aws_route53_zone.heyvaldemar_com]
}
