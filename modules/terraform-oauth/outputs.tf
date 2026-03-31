output "oauth_client" {
  value = {
    id = tfe_oauth_client.oauth_client.id
    oauth_token = nonsensitive(
      tfe_oauth_client.oauth_client.oauth_token
    )
  }
}