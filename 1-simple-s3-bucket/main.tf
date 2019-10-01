# 1. Init
# 2. Plan
# 3. Apply
# 4. Replacement
# 5. Change
# 6. State

# https://www.terraform.io/docs/providers/aws/r/s3_bucket.html

resource "aws_s3_bucket" "nordev" {
  bucket = "norfolk-developers-demo-02-09-19"
}