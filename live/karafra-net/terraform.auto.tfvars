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
        description = "Workspace for the karafrorg homelab project"
        additional_tags = {
          environment = "homelab"
          repository  = "KarafrOrg/infra-gcp"
        }
      }
    }
  }
}
