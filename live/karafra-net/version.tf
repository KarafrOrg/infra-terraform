terraform {
  required_version = "~> 1.14"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.27.0"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.70.0"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "karafrorg-homelab"

    workspaces {
      name = "karafrorg-infra-terraform-karafra-net_tmp"
    }
  }
}

provider "tfe" {
  hostname = "app.terraform.io"
  token    = var.tfe_token
}

provider "google" {}
