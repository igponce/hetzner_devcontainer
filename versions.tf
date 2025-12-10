// versions.tf
terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = ">= 1.36.0"
    }
  }

  required_version = ">= 1.5.0"
}
