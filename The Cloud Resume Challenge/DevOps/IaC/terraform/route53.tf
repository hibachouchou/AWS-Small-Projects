resource "aws_route53_zone" "primary" {
  name = "https://cloud-challenge-resume.cloud"
}

resource "aws_route53_record" "cloud-challenge-resume.cloud" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "cloud-challenge-resume.cloud"
  type    = "A"
  alias {
    name                   = var.cloudfront_domain_name
    zone_id                = var.cloudfront_zone_id
    evaluate_target_health = false
  }
}
