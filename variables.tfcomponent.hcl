# Authentication variables
variable "terraform_cloud_token" {
  description = "Terraform Cloud API token with permissions to manage workspaces and variables."
  type        = string
  sensitive   = true
  ephemeral   = true
}

variable "organizations" {
  description = "Map of Terraform Cloud organization configurations"
  type = map(object({
    email                    = string
    enable_speculative_plans = bool
  }))
}
