organization_name              = "karafra-net"
organization_mail_address      = "terraform-cloud+karafra-net@karafra.net"
organization_options           = {}
organization_oauth_secret_name = "karafrorg-github-token"
projects = {
  "karafra-net" = {
    description = "Project for the karafrorg homelab"
    additional_tags = {
      environment = "homelab"
      owner       = "KarafrOrg"
    }
    workspaces = {
      "infra-gcp" = {
        description = "Workspace for GCP orchestration"
        additional_tags = {
          environment = "homelab"
          repository  = "infra-gcp"
        }
      }
      "infra-terraform" = {
        description = "Workspace for the Terraform cloud orchestration"
        additional_tags = {
          environment = "homelab"
          repository  = "infra-terraform"
        }
      }
      "infra-cloudflare" = {
        description = "Workspace for the Cloudflare orchestration"
        additional_tags = {
          environment = "homelab"
          repository  = "infra-cloudflare"
        }
      }
      "infra-ovh" = {
        description = "Workspace for the OVH orchestration"
        additional_tags = {
          environment = "homelab"
          repository  = "infra-ovh"
        }
      }
      "infra-github" = {
        description = "Workspace for the GitHub orchestration"
        additional_tags = {
          environment = "homelab"
          repository  = "infra-github"
        }
      }
      "infra-cluster" = {
        description = "Workspace for bootstraping of kubernetes cluster"
        additional_tags = {
          environment = "homelab"
          repository  = "infra-cluster"
        }
      }
    }
  }
}
