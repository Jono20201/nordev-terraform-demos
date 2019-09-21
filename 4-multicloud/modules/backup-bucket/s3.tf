resource "aws_s3_bucket" "backups" {
  bucket = "norfolk-developers-minecraft-backup"

  force_destroy = true

  lifecycle_rule {
    id = "glacier"
    enabled = true

    transition {
      days = 30
      storage_class = "GLACIER"
    }

    expiration {
      days = 120
    }
  }
}