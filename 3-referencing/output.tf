output "s3_domain" {
  value = "http://${aws_s3_bucket.nordev.website_endpoint}"
}