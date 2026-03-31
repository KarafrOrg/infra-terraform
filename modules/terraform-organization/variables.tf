variable "organizations" {
  description = "Map of Terraform Cloud organization configurations"
  type = map(object({
    email                    = string
    enable_speculative_plans = bool
  }))
}
