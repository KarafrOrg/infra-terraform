terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.74.1"
    }
  }
}

provider "tfe" "main" {
  config {
    token = var.terraform_cloud_token
  }
}
