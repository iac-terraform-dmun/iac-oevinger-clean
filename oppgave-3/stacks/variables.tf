variable "rg_name" {
  type        = string
  description = "Navnet på resource group-en miljøet har opprettet"
}

variable "location" {
  type        = string
  description = "Azure-regionen ressursene opprettes i"
}

variable "name_suffix" {
  type        = string
  description = "Felles suffiks modulene bygger ressursnavn av"
}

variable "common_tags" {
  type        = map(string)
  description = "Tags som skal legges på alle ressursene"
}

variable "vnet_address_space" {
  type        = string
  description = "Adresserommet for VNET-en, f.eks. 10.30.0.0/16"
}

variable "subnets" {
  type        = map(number)
  description = "Subnett som skal opprettes: navn => netnum innenfor adresserommet"
}

variable "vm_subnet_key" {
  type        = string
  description = "Nøkkelen i subnets som VM-en skal plasseres i"

  validation {
    condition     = contains(keys(var.subnets), var.vm_subnet_key)
    error_message = "vm_subnet_key må være et av navnene i subnets."
  }
}

variable "vm_size" {
  type        = string
  description = "Størrelsen på VM-en som skal opprettes"
}

variable "admin_username" {
  type        = string
  description = "Brukernavnet til administratoren på VM-en"
}

variable "admin_ssh_key" {
  type        = string
  description = "Offentlig SSH-nøkkel for administratoren på VM-en"
}
