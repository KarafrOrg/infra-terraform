resource "tfe_oauth_client" "oauth_client" {
  service_provider = "github"
  api_url          = "https://api.github.com"
  http_url         = "https://github.com"
  oauth_token      = var.oauth_token
}
