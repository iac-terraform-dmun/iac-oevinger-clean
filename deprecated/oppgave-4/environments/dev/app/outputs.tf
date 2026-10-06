output "vm_name" {
  value       = module.compute.vm_name
  description = "Navnet på den virtuelle maskinen"
}

output "vm_principal_id" {
  value       = module.compute.principal_id
  description = "Principal-ID for VM-ens system-tildelte identitet"
}
