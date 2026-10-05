output "vm_name" {
  value       = azurerm_linux_virtual_machine.main.name
  description = "Navnet på den virtuelle maskinen"
}

output "vm_id" {
  value       = azurerm_linux_virtual_machine.main.id
  description = "Ressurs-ID-en til den virtuelle maskinen"
}

output "principal_id" {
  value       = azurerm_linux_virtual_machine.main.identity[0].principal_id
  description = "Principal-ID for VM-ens system-tildelte identitet"
}
