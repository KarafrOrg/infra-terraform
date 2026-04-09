variable "organization_name" {
  description = "Name of the Terraform Cloud organization to which the OAuth client will be associated."
  type        = string
}

variable "organization_mail_address" {
  description = "Email address associated with the Terraform Cloud organization. This is used for notifications and account management purposes."
  type        = string
}

variable "organization_options" {
  description = "Additional options for the Terraform Cloud organization, such as enabling speculative plans. This allows for customization of the organization's behavior and features."
  type = object({
    default_execution_strategy = optional(string)
    enable_speculative_plans   = optional(bool)
  })
}
