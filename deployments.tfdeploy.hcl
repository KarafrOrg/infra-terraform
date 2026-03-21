store "varset" "credentials" {
  name     = "infra-terraform-variables"
  category = "terraform"
}

deployment "production" {
  inputs = {
    terraform_cloud_token = store.varset.credentials.terraform_cloud_token

    // region Organizations
    organizations = {
      "karafrorg-homelab" = {
        email                    = store.varset.credentials.stable.homelab_org_email
        enable_speculative_plans = false
      }
    }
    // endregion

    // region Projects
    projects = [
      {
        name              = "karafrorg-homelab-project"
        organization_name = "karafrorg-homelab"
        workspaces = {
          "karafrorg-homelab-project-workspace" = {
            additional_tags = {
              environment = "production"
            }
          }
          "karafrorg-homelab-project-dev" = {
            additional_tags = {
              environment = "development"
            }
          }
        },
        stacks = {
          "karafrorg-homelab-project-stack" = {
            additional_tags = {
              environment = "production"
            }
          }
          "karafrorg-homelab-project-dev-stack" = {
            additional_tags = {
              environment = "development"
            }
          }
        }
      }
    ]
    // endregion
  }
}
