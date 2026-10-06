output "subnet_ids" {
  value       = { for key, subnet in azurerm_subnet.subnet : key => subnet.id }
  description = "ID-ene til subnettene som er opprettet"
}