resource "tfe_organization" "organization" {
  for_each                            = var.organizations
  name                                = each.key
  email                               = each.value.email
  speculative_plan_management_enabled = each.value.enable_speculative_plans
  lifecycle {
    prevent_destroy = true
  }
}

resource "tfe_organization_default_settings" "default" {
  for_each               = var.organizations
  organization           = tfe_organization.organization[each.key].id
  default_execution_mode = local.default_execution_strategy
}
