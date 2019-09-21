# 1. Basics of referencing anouther resource.
# 2. Outputs
# 3. Taint

# https://www.terraform.io/docs/providers/aws/r/s3_bucket.html
resource "aws_s3_bucket" "nordev" {
  bucket = "norfolk-developers-website-demo-02-09-19"

  acl = "public-read"

  website {
    index_document = "index.html"
  }
}

# https://www.terraform.io/docs/providers/aws/r/s3_bucket_object.html
resource "aws_s3_bucket_object" "index" {
  bucket = aws_s3_bucket.nordev.bucket

  key = "index.html"
  acl = "public-read"
  source = "index.html"
  content_type = "text/html"

  etag = filemd5("index.html")
}