variable "parent_project_name" {
  description = "Name of the parent project to which the workspaces will be associated. This should match the name of an existing project in Terraform Cloud."
  type        = string
}

variable "parent_organization_name" {
  description = "Name of the parent organization to which the workspaces will be associated. This should match the name of an existing organization in Terraform Cloud."
  type        = string
}

variable "workspaces" {
  description = "Map of workspaces to create in Terraform Cloud. Each workspace will be associated with a specific project."
  type = map(object({
    desription               = optional(string)
    additional_tags          = optional(map(string))
    additional_variable_sets = optional(list(string))
  }))
}
