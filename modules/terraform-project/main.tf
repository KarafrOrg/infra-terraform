data "tfe_organization" "organization" {
  for_each = { for project in var.projects : project.name => project }
  name     = each.value.organization
}

resource "tfe_project" "project" {
  for_each     = { for project in var.projects : project.name => project }
  name         = each.key
  organization = data.tfe_organization.organization[each.key].id
  tags         = merge(each.value.additional_tags, local.default_project_tags)
}
