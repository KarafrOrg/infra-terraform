data "tfe_organization" "organization" {
  name = var.organization_name
}

data "google_secret_manager_secret_version" "oauth_token" {
  secret = var.organization_oauth_secret_name
}

resource "tfe_oauth_client" "oauth_client" {
  service_provider = local.default_oauth_service_provider
  api_url          = local.default_oauth_api_url
  http_url         = local.default_oauth_http_url
  oauth_token      = data.google_secret_manager_secret_version.oauth_token.secret_data
  organization     = data.tfe_organization.organization.name
}
