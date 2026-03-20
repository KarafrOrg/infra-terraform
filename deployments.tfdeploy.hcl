store "varset" "credentials" {
  name     = "infra-terraform-variables"
  category = "terraform"
}

deployment "production" {
  inputs = {
    terraform_cloud_token = store.varset.credentials.terraform_cloud_token

    // region Organizations
    organizations = {
      "homelab" = {
        email                    = store.varset.credentials.stable.homelab_org_email
        enable_speculative_plans = false
      }
    }
    // endregion
  }
}
