module "backups" {
  source = "./modules/backup-bucket"
}

module "server" {
  source = "./modules/do_minecraft"

  backup_aws_access_key_id = module.backups.access_key_id
  backup_aws_access_key_secret = module.backups.access_key_secret
  backup_bucket_name = module.backups.bucket_name
}