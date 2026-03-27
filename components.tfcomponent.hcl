component "terraform-organization" {
  source = "./modules/terraform-organization"

  providers = {
    tfe = provider.tfe.main
  }

  inputs = {
    organizations = var.organizations
  }
}

component "terraform-project" {
  source = "./modules/terraform-project"

  providers = {
    tfe = provider.tfe.main
  }

  inputs = {
    projects = var.projects
  }

  depends_on = [
    component.terraform-organization
  ]
}

component "terraform-workspace" {
  source = "./modules/terraform-workspace"

  providers = {
    tfe = provider.tfe.main
  }

  inputs = {
    workspaces = flatten([
      for project in var.projects : [
        for ws_name, ws in project.workspaces : {
          name              = ws_name
          project_name      = project.name
          organization_name = project.organization_name
          description = try(ws.description, null)
          additional_variable_sets = try(ws.additional_variable_sets, [])
          additional_tags = merge(
            try(project.additional_tags, {}),
            try(ws.additional_tags, {})
          )
        }
      ]
    ])
  }

  depends_on = [
    component.terraform-project
  ]
}

component "terraform-oauth" {
  source = "./modules/terraform-oauth"

  providers = {
    tfe = provider.tfe.main
  }

  inputs = {
    oauth_token = var.authorization.github.token
    organization_names = keys(var.organizations)
  }
}

component "terraform-stack" {
  source = "./modules/terraform-stack"

  providers = {
    tfe    = provider.tfe.main
    github = provider.github.main
  }

  inputs = {
    stacks = flatten([
      for project in var.projects : [
        for stack_name, stack in project.stacks : {
          name              = stack_name
          project_name      = project.name
          organization_name = project.organization_name
          description = try(stack.description, null)
          additional_tags = merge(
            try(project.additional_tags, {}),
            try(stack.additional_tags, {})
          )
          repository = merge(
            stack.repository,
            { oauth_token_id = component.terraform-oauth.outputs.oauth_token_id }
          )
        }
      ]
    ])
  }

  depends_on = [
    component.terraform-project,
    component.terraform-oauth
  ]
}