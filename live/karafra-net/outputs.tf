output "oauth_client" {
  value     = module.infra_terraform.oauth_client
  sensitive = true
}

output "organization" {
  value = module.infra_terraform.organization
}

output "projects" {
  value = module.infra_terraform.projects
}

output "project_variable_sets" {
  value = module.infra_terraform.project_variable_sets
}

output "workspaces" {
  value = module.infra_terraform.workspaces
}

output "workspace_variable_sets" {
  value = module.infra_terraform.workspace_variable_sets
}
