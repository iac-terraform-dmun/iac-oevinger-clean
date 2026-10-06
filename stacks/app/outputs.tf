output "nic_name" {
  value       = azurerm_network_interface.main.name
  description = "Navnet på nettverkskortet"
}

output "private_ip_address" {
  value       = azurerm_network_interface.main.private_ip_address
  description = "Den private IP-adressen nettverkskortet fikk i subnettet"
}
