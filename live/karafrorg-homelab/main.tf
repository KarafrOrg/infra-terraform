module "infra_terraform" {
  source                         = "../../modules/infra-terraform"
  tfe_token                      = var.tfe_token
  organization_mail_address      = var.organization_mail_address
  organization_name              = var.organization_name
  organization_oauth_secret_name = var.organization_oauth_secret_name
  organization_options           = var.organization_options
  projects                       = var.projects
}
