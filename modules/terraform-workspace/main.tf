data "tfe_project" "parent" {
  for_each = { for workspace in var.workspaces : workspace.name => workspace }
  name     = each.value.project
}

resource "tfe_workspace" "default" {
  for_each    = { for workspace in var.workspaces : workspace.name => workspace }
  name        = each.key
  description = try(each.value.desription, "${each.key} workspace")
  tags        = merge(each.value.additional_tags, local.default_workspace_tags)
  project_id  = data.tfe_project.parent[each.key].id
}

resource "tfe_workspace_variable_set" "default" {
  for_each        = { for workspace in var.workspaces : workspace.name => workspace }
  variable_set_id = local.default_variable_set_name
  workspace_id    = tfe_workspace.default[each.key].id
}

resource "tfe_workspace_variable_set" "default" {
  for_each        = { for workspace in var.workspaces : workspace.name => workspace }
  variable_set_id = local.default_variable_set_name
  workspace_id    = tfe_workspace.default[each.key].id
}
