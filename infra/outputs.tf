output "certificate_validation_records" {
  description = "Add these as CNAME records at Name.com"
  value = [
    for o in aws_acm_certificate.site.domain_validation_options : {
      host   = trimsuffix(trimsuffix(o.resource_record_name, "."), ".${var.domain}")
      answer = trimsuffix(o.resource_record_value, ".")
    }
  ]
}

output "cloudfront_domain" {
  description = "ANAME for the bare domain and CNAME for www point here"
  value       = aws_cloudfront_distribution.site.domain_name
}

output "bucket" {
  value = aws_s3_bucket.site.bucket
}

output "distribution_id" {
  value = aws_cloudfront_distribution.site.id
}

output "deploy_role_arn" {
  value = aws_iam_role.deploy.arn
}
