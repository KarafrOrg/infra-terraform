variable "oauth_token" {
  description = "The OAuth token to authenticate with the service provider (e.g., GitHub)."
  type        = string
  sensitive   = true
}

variable "organization_names" {
  description = "The name of the Terraform Cloud organization to associate the OAuth client with."
  type        = list(string)
}
