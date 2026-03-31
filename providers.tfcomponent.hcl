required_providers {
  tfe = {
    source  = "hashicorp/tfe"
    version = "0.76.0"
  }
  github = {
    source  = "integrations/github"
    version = "6.6.0"
  }
  null = {
    source  = "hashicorp/null"
    version = "3.2.4"
  }
}

provider "tfe" "main" {
  config {
    token = var.terraform_cloud_token
    organization = "karafrorg-homelab"
  }
}

provider "github" "main" {
  config {
    token = var.authorization.github.token
  }
}

provider "null" "main" {
  config {}
}