# Outputs er grensesnittet mot app-stacken. Alt som står her, kan leses av
# andre stacks gjennom terraform_remote_state.
output "subnet_ids" {
  value       = module.network.subnet_ids
  description = "Subnet-ID per subnettnavn. Leses av app-stacken."
}

output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "Ressursgruppa miljøet ligger i. Leses av app-stacken."
}

output "location" {
  value       = azurerm_resource_group.rg.location
  description = "Regionen miljøet ligger i. Leses av app-stacken."
}
