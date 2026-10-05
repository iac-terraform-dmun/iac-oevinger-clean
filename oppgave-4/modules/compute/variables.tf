variable "rg_name" {
  type        = string
  description = "Navnet på resource group-en ressursene skal ligge i"
}

variable "location" {
  type        = string
  description = "Azure-regionen ressursene opprettes i"
}

variable "name_suffix" {
  type        = string
  description = "Felles suffiks som modulen bygger ressursnavn av"
}

variable "subnet_id" {
  type        = string
  description = "ID-en til subnettet VM-en skal ligge i"
}

variable "vm_size" {
  type        = string
  description = "Størrelsen på VM-en som skal opprettes"
}

variable "tags" {
  type        = map(string)
  description = "Tags som skal legges på ressursene"
}

variable "admin_username" {
  type        = string
  description = "Brukernavnet til administratoren på VM-en"
}

variable "admin_ssh_key" {
  type        = string
  description = "Offentlig SSH-nøkkel for administratoren på VM-en"
}
