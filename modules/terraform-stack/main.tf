data "github_repository" "repository" {
  for_each = { for stack in var.stacks : stack.name => stack.repository }
  name     = each.value["name"]
}

data "tfe_project" "parent" {
  for_each     = { for stack in var.stacks : stack.name => stack }
  name         = each.value.project_name
  organization = each.value.organization_name
}

resource "tfe_stack" "managed" {
  for_each   = { for stack in var.stacks : stack.name => stack }
  name       = each.value.name
  #project_id = data.tfe_project.parent[each.key].id
  project_id = "prj-VhQT7fVtBs225enP"
#  vcs_repo {
#    identifier     = "KarafrOrg/infra-terraform"
#    branch         = each.value.repository.default_branch
#    oauth_token_id = each.value.repository.oauth_token_id
#  }
}
