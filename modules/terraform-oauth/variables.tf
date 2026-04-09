variable "organization_name" {
  description = "Name of the Terraform Cloud organization to which the OAuth client will be associated."
  type        = string
}

variable "organization_oauth_secret_name" {
  description = "Name of the Kubernetes secret that contains the OAuth token for the Terraform Cloud organization. This secret should be created in the same namespace where the Terraform provider is running."
  type        = string
  sensitive   = true
}
