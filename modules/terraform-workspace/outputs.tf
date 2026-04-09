output "workspaces" {
  value = tfe_workspace.default
}

output "workspace_variable_sets" {
  value = merge(tfe_variable_set.default, tfe_variable_set.additional)
}
