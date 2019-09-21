resource "aws_iam_user" "mc-backup-user" {
  name = "mc-backup-user"
}

resource "aws_iam_access_key" "mc-backup-user" {
  user = aws_iam_user.mc-backup-user.name
}

data "aws_iam_policy_document" "access-backup-bucket" {
  statement {
    sid = "AllowListingBucket"
    actions = [
      "s3:ListBucket"
    ]
    resources = [
      aws_s3_bucket.backups.arn
    ]
  }
  statement {
    sid = "AllowUploadingBackups"
    actions = [
      "s3:PutObject",
      "s3:DeleteObject"
    ]
    resources = [
      "${aws_s3_bucket.backups.arn}/*"
    ]
  }
}

resource "aws_iam_policy" "access-backup-bucket" {
  name = "_Minecraft.AccessBackupBucket"
  policy = data.aws_iam_policy_document.access-backup-bucket.json
}

resource "aws_iam_user_policy_attachment" "access-backup-bucket" {
  policy_arn = aws_iam_policy.access-backup-bucket.arn
  user = aws_iam_user.mc-backup-user.name
}