output "backend_resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "Ressursgruppa state-lagringen ligger i."
}

output "backend_storage_account_name" {
  value       = azurerm_storage_account.sa.name
  description = "Storage account-et state-filene lagres i."
}

output "backend_container_name" {
  value       = azurerm_storage_container.tfstate.name
  description = "Containeren state-filene lagres i."
}

output "backend_hcl_template" {
  value       = <<-EOT
    resource_group_name  = "${azurerm_resource_group.rg.name}"
    storage_account_name = "${azurerm_storage_account.sa.name}"
    container_name       = "${azurerm_storage_container.tfstate.name}"
    use_azuread_auth     = true
  EOT
  description = "Skrives til shared/backend.hcl med terraform output -raw."
}
