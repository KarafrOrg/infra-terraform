variable "parent_organization_name" {
  description = "Name of the parent organization to which the projects will be associated. This should match the name of an existing organization in Terraform Cloud."
  type        = string
}

variable "projects" {
  description = "List of projects to create in Terraform Cloud. Each project will be associated with a specific organization."
  type = map(object({
    additional_tags = optional(map(string))
    description     = optional(string)
  }))
}
