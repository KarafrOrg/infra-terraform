data "tfe_project" "parent" {
  for_each = { for workspace in var.workspaces : workspace.name => workspace }
  name     = each.value.project_name
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

resource "tfe_workspace_variable_set" "additional" {
  for_each = {
    for pair in flatten([
      for workspace in var.workspaces : [
        for variable_set in var.workspaces.additional_variable_sets : {
          workspace_name    = workspace.name
          variable_set_name = variable_set
        }
      ]
    ]) : "${pair.workspace_name}:/${pair.variable_set}" => pair
  }
  variable_set_id = each.value["variable_set_name"]
  workspace_id    = tfe_workspace.default[each.value["workspace_name"]].id
}
