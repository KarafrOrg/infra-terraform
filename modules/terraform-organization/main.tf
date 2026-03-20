resource "tfe_organization" "organization" {
  for_each                            = var.organizations
  name                                = each.key
  email                               = each.value.email
  speculative_plan_management_enabled = each.value.enable_speculative_plans
  lifecycle {
    prevent_destroy = true
  }
}
