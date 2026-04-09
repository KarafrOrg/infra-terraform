variable "tfe_token" {
  description = "Terraform Cloud API token with permissions to manage organizations, projects, and workspaces. This token should be stored securely, such as in a Kubernetes secret or an environment variable."
  type        = string
  sensitive   = true
  ephemeral   = true
}

variable "organization_name" {
  description = "Name of the Terraform Cloud organization to which the OAuth client will be associated."
  type        = string
}

variable "organization_mail_address" {
  description = "Email address associated with the Terraform Cloud organization. This is used for notifications and account management purposes."
  type        = string
}

variable "organization_oauth_secret_name" {
  description = "Name of the Kubernetes secret that contains the OAuth token for the Terraform Cloud organization. This secret should be created in the same namespace where the Terraform provider is running."
  type        = string
  sensitive   = true
}

variable "organization_options" {
  description = "Additional options for the Terraform Cloud organization, such as enabling speculative plans. This allows for customization of the organization's behavior and features."
  type = object({
    enable_speculative_plans                                = optional(bool, true)
    cost_estimation_enabled                                 = optional(bool, true)
    send_passing_statuses_for_untriggered_speculative_plans = optional(bool, false)
    aggregated_commit_statuses_enabled                      = optional(bool, false)
    speculative_plan_management_enabled                     = optional(bool, false)
    default_execution_strategy                              = optional(string, "local")
  })
}

variable "projects" {
  description = "List of projects to create in Terraform Cloud. Each project will be associated with a specific organization."
  type = map(object({
    additional_tags = optional(map(string))
    description     = optional(string)
    workspaces = optional(map(object({
      additional_tags          = optional(map(string))
      description              = optional(string)
      additional_variable_sets = optional(list(string))
    })))
  }))
}
