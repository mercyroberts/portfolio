# DNS lives at Name.com, so validation records are added there by hand.
# Apply this file first (-target), add the CNAME it outputs, then apply the rest.
resource "aws_acm_certificate" "site" {
  provider                  = aws.us_east_1
  domain_name               = var.domain
  subject_alternative_names = ["www.${var.domain}"]
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "site" {
  provider        = aws.us_east_1
  certificate_arn = aws_acm_certificate.site.arn

  timeouts {
    create = "2h"
  }
}
