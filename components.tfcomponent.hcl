component "terraform-organization" {
  source = "./modules/terraform-organization"

  providers = {
    tfe = provider.tfe.main
  }

  inputs = {
    organizations = var.organizations
  }
}

component "terraform-project" {
  source = "./modules/terraform-project"

  providers = {
    tfe = provider.tfe.main
  }

  inputs = {
    projects = var.projects
  }
}
