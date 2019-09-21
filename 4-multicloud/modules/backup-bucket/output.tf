output "access_key_id" {
  value = aws_iam_access_key.mc-backup-user.id
}

output "access_key_secret" {
  value = aws_iam_access_key.mc-backup-user.secret
}

output "bucket_name" {
  value = aws_s3_bucket.backups.bucket
}