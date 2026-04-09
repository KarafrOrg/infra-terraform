data "tfe_organization" "organization" {
  name = var.parent_organization_name
}

resource "tfe_project" "project" {
  for_each     = var.projects
  name         = each.key
  description  = try(each.value.description, "${each.key} project")
  organization = data.tfe_organization.organization.name
  tags         = merge(each.value.additional_tags, local.default_project_tags)
}

resource "tfe_variable_set" "default" {
  for_each     = var.projects
  name         = replace(replace(lower("${local.default_project_variable_set_name_prefix}${each.key}${local.default_project_variable_set_name_suffix}"), " ", "_"), "-", "_")
  organization = data.tfe_organization.organization.name
}

resource "tfe_project_variable_set" "default" {
  for_each        = var.projects
  project_id      = tfe_project.project[each.key].id
  variable_set_id = tfe_variable_set.default[each.key].id
}
