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
    name              = string
    organization_name = string
    additional_tags = optional(map(string))
    workspaces = map(object({
      additional_tags = optional(map(string))
      additional_variable_sets = optional(list(string))
    }))
    stacks = map(object({
      additional_tags = optional(map(string))
    }))
  }))
}

variable "authorization" {
  description = "GitHub App authorization configuration for Terraform Cloud. This includes the app's client ID, client secret, and the organization it should be associated with."
  type = object({
    github = object({
      token = string
    })
  })
  sensitive = true
}
