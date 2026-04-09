resource "tfe_organization" "organization" {
  name                                = var.organization_name
  email                               = var.organization_mail_address
  speculative_plan_management_enabled = var.organization_options.enable_speculative_plans
  lifecycle { prevent_destroy = true }
}

resource "tfe_organization_default_settings" "default" {
  organization           = tfe_organization.organization.name
  default_execution_mode = var.organization_options.default_execution_strategy
}
