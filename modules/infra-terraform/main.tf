module "terraform_organization" {
  source                    = "../terraform-organization"
  organization_mail_address = var.organization_mail_address
  organization_name         = var.organization_name
  organization_options = {
    enable_speculative_plans   = var.organization_options.enable_speculative_plans
    default_execution_strategy = var.organization_options.default_execution_strategy
  }
}

module "terraform_oauth" {
  source                         = "../terraform-oauth"
  organization_oauth_secret_name = var.organization_oauth_secret_name
  organization_name              = var.organization_name
  depends_on = [
    module.terraform_organization
  ]
}

module "terraform_project" {
  source                   = "../terraform-project"
  parent_organization_name = var.organization_name
  projects                 = var.projects
  depends_on = [
    module.terraform_organization,
    module.terraform_oauth
  ]
}

module "terraform_workspace" {
  source                   = "../terraform-workspace"
  for_each                 = var.projects
  parent_organization_name = var.organization_name
  parent_project_name      = each.key
  workspaces               = lookup(each.value, "workspaces")
  depends_on = [
    module.terraform_organization,
    module.terraform_oauth,
    module.terraform_project
  ]
}
