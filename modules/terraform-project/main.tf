data "tfe_organization" "organization" {
  for_each = { for project in var.projects : project.name => project }
  name     = each.value.organization
}

resource "tfe_project" "project" {
  for_each     = { for project in var.projects : project.name => project }
  name         = each.key
  organization = data.tfe_organization.organization[each.key].name
  tags         = merge(each.value.additional_tags, local.default_project_tags)
}

resource "tfe_project_variable_set" "default" {
  project_id      = tfe_project.project.id
  variable_set_id = local.default_variable_set_name
}
