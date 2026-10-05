output "subnet_ids" {
  value       = module.network.subnet_ids
  description = "ID-ene til subnettene, slått opp på navn"
}

output "vm_name" {
  value       = module.compute.vm_name
  description = "Navnet på den virtuelle maskinen"
}

output "vm_principal_id" {
  value       = module.compute.principal_id
  description = "Principal-ID for VM-ens system-tildelte identitet"
}

output "subscription_id" {
  value       = data.azurerm_client_config.current.subscription_id
  description = "Abonnementet stacken ble rullet ut i"
}
