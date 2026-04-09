output "oauth_client" {
  value = module.terraform_oauth.oauth_client
}

output "organization" {
  value = module.terraform_organization.organizations
}

output "projects" {
  value = module.terraform_project.projects
}

output "project_variable_sets" {
  value = module.terraform_project.variable_sets
}

output "workspaces" {
  value = merge([for k, ws in module.terraform_workspace : ws.workspaces]...)
}

output "workspace_variable_sets" {
  value = merge([for k, ws in module.terraform_workspace : ws.workspace_variable_sets]...)
}