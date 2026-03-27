store "varset" "credentials" {
  name     = "infra-terraform-variables"
  category = "terraform"
}

deployment "production" {
  inputs = {
    terraform_cloud_token = store.varset.credentials.terraform_cloud_token

    // region Authorization
    authorization = {
      github = {
        token = store.varset.credentials.stable.github_token
      }
    }
    // endregion

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
          "karafrorg_homelab_project_prod" = {
            additional_tags = {
              environment = "production"
            }
          }
          "karafrorg_homelab_project_dev" = {
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
