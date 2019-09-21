provider "aws" {
  profile = "playground"

  region = "eu-west-1"
}

provider "digitalocean" {
  // I have a DIGITALOCEAN_TOKEN environment variable setup.
}