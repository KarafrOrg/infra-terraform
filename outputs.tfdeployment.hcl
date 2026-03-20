publish_output "tfe_organizations" {
  description = "Created TFE organizations"
  value       = component.terraform-organization.created_organizations
}
