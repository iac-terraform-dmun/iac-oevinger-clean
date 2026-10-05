variable "company" {
  type        = string
  description = "Navnet på selskapet som eier ressursene"
}

variable "short_name" {
  type        = string
  description = "Personlig kortnavn som holder ressursnavn unike i delt tenant"
}

variable "environment" {
  type        = string
  description = "Navnet på miljøet ressursene opprettes i (f.eks. dev, test, prod)"
}

variable "owner" {
  type        = string
  description = "Navnet på eieren av ressursene"
}

variable "location" {
  type        = string
  description = "Azure-regionen ressursene opprettes i"

  validation {
    condition     = contains(["northeurope", "uksouth", "westeurope", "norwayeast", "norwaywest"], var.location)
    error_message = "location må være en av de tillatte regionene i tenanten."
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

variable "vnet_address_space" {
  type        = string
  description = "Adresserommet for miljøets VNET, f.eks. 10.30.0.0/16"
}

variable "subnets" {
  type        = map(number)
  description = "Subnett som skal opprettes: navn => netnum innenfor adresserommet"
}

variable "vm_subnet_key" {
  type        = string
  description = "Nøkkelen i subnets som VM-en skal plasseres i"
}
