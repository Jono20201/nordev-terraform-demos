# 1. A look at the two formats that AWS provide.
# 2. How to run directly using AWS command

# https://www.terraform.io/docs/providers/aws/r/s3_bucket.html

resource "aws_s3_bucket" "nordev" {
  bucket = "norfolk-developers-comparison-demo-02-09-19"
}