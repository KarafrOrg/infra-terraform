required_providers {
  tfe = {
    source  = "hashicorp/tfe"
    version = "0.74.1"
  }
  github = {
    source  = "integrations/github"
    version = "6.6.0"
  }
}


provider "tfe" "main" {
  config {
    token = var.terraform_cloud_token
  }
}

provider "github" "main" {
  config {
    token = var.authorization.github.token
  }
}
