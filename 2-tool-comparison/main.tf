# https://www.terraform.io/docs/providers/aws/r/s3_bucket.html

resource "aws_s3_bucket" "nordev" {
  bucket = "norfolk-developers-comparison-demo-02-09-19"
}