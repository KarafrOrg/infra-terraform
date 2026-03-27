data "tfe_organization" "organization" {
  for_each = { for organization in var.organization_names : organization => organization }
  name     = each.key
}

resource "tfe_oauth_client" "oauth_client" {
  for_each         = { for organization in var.organization_names : organization => organization }
  service_provider = "github"
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.oauth_token
  organization     = data.tfe_organization.organization[each.key].name
}
