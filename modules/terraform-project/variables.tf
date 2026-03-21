variable "projects" {
  description = "List of projects to create in Terraform Cloud. Each project will be associated with a specific organization."
  type = list(object({
    name            = string
    organization    = string
    additional_tags = optional(map(string))
  }))
}
