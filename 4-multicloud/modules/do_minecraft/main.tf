data "digitalocean_ssh_key" "ssh-key" {
  name = "jonathan"
}

resource "digitalocean_droplet" "minecraft" {
  image = "ubuntu-18-04-x64"
  name = "nordev-demo"
  region = "lon1"
  size = "s-4vcpu-8gb"

  ssh_keys = [
    data.digitalocean_ssh_key.ssh-key.id
  ]

  user_data = templatefile("${path.module}/userdata.sh", {
    aws_access_key_id = var.backup_aws_access_key_id
    aws_secret_access_key = var.backup_aws_access_key_secret
    aws_backup_bucket_name = var.backup_bucket_name
  })
}
