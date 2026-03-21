variable "workspaces" {
  description = "List of workspaces to create in Terraform Cloud. Each workspace will be associated with a specific project."
  type = list(object({
    name                     = string
    project_name             = string
    desription               = optional(string)
    additional_tags          = optional(map(string))
    additional_variable_sets = optional(list(string))
  }))
}
