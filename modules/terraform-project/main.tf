data "tfe_organization" "organization" {
  for_each = { for project in var.projects : project.name => project }
  name     = each.value.organization_name
}


resource "tfe_project" "project" {
  for_each     = { for project in var.projects : project.name => project }
  name         = each.key
  description  = try(each.value.description, "${each.key} project")
  organization = data.tfe_organization.organization[each.key].name
  tags         = merge(each.value.additional_tags, local.default_project_tags)
}

resource "tfe_variable_set" "default" {
  for_each     = { for project in var.projects : project.name => project }
  name         = local.default_variable_set_name
  organization = data.tfe_organization.organization[each.key].name
}

resource "tfe_project_variable_set" "default" {
  for_each        = { for project in var.projects : project.name => project }
  project_id      = tfe_project.project[each.key].id
  variable_set_id = tfe_variable_set.default[each.key].id
}
