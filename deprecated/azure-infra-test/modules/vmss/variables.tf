variable "subnet_id" {
  type        = string
  description = "ID of the subnet"
  default     = ""
}

variable "vmss_name" {
  type        = string
  description = "Navnet på VMSS-en som skal opprettes"
}
variable "rg_name" {
  type        = string
  description = "Navnet på resource group-en som skal opprettes"
}

variable "location" {
  type        = string
  description = "Azure-regionen ressursene opprettes i"
}

variable "admin_password" {
  type        = string
  description = "Administratorpassordet til VM-ene i scale set-et"
  sensitive   = true
}
