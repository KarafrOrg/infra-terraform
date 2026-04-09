data "tfe_project" "parent" {
  name         = var.parent_project_name
  organization = var.parent_organization_name
}

resource "tfe_workspace" "default" {
  for_each     = var.workspaces
  name         = each.key
  description  = try(each.value.desription, "${each.key} workspace")
  tags         = merge(each.value.additional_tags, local.default_workspace_tags)
  project_id   = data.tfe_project.parent.id
  organization = var.parent_organization_name
}

resource "tfe_variable_set" "default" {
  for_each     = var.workspaces
  name         = "${local.default_variable_set_name_prefix}${each.key}${local.default_variable_set_name_suffix}"
  organization = var.parent_organization_name
}

resource "tfe_workspace_variable_set" "default" {
  for_each        = var.workspaces
  variable_set_id = tfe_variable_set.default[each.key].id
  workspace_id    = tfe_workspace.default[each.key].id
}

resource "tfe_variable_set" "additional" {
  for_each = {
    for pair in flatten([
      for workspace_key, workspace in var.workspaces : [
        for variable_set in coalesce(workspace.additional_variable_sets, []) : {
          workspace_name    = workspace_key
          variable_set_name = variable_set
          organization_name = var.parent_organization_name
        }
      ]
    ]) : "${pair.workspace_name}:${pair.variable_set_name}" => pair
  }
  name         = each.value.variable_set_name
  organization = each.value.organization_name
}

resource "tfe_workspace_variable_set" "additional" {
  for_each = {
    for pair in flatten([
      for workspace_key, workspace in var.workspaces : [
        for variable_set in coalesce(workspace.additional_variable_sets, []) : {
          workspace_name    = workspace_key
          variable_set_name = variable_set
        }
      ]
    ]) : "${pair.workspace_name}:${pair.variable_set_name}" => pair
  }
  variable_set_id = tfe_variable_set.additional[each.key].id
  workspace_id    = tfe_workspace.default[each.value.workspace_name].id
}
