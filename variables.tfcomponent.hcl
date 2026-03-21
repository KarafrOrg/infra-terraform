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

variable "projects" {
  description = "List of projects to create in Terraform Cloud. Each project will be associated with a specific organization."
  type = list(object({
    name         = string
    organization = string
    additional_tags = map(string)
  }))
}