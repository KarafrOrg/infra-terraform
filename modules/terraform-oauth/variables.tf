variable "oauth_token" {
  description = "The OAuth token to authenticate with the service provider (e.g., GitHub)."
  type        = string
  sensitive   = true
}
