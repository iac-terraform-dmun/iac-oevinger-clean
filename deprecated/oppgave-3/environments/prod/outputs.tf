output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "Navnet på ressursgruppa miljøet eier"
}

output "subnet_ids" {
  value       = module.stack.subnet_ids
  description = "Subnet-IDer slått opp på navn"
}

output "vm_name" {
  value       = module.stack.vm_name
  description = "Navnet på den virtuelle maskinen"
}

output "vm_principal_id" {
  value       = module.stack.vm_principal_id
  description = "Principal-ID for VM-ens system-tildelte identitet"
}
