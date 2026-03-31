terraform {
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
}
