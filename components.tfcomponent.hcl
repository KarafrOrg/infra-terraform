component "terraform-organization" {
  source = "./modules/terraform-organization"

  providers = {
    tfe = provider.tfe.main
  }

  inputs = {
    organizations = var.organizations
  }
}
