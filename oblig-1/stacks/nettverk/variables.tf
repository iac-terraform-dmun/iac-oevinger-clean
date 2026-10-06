variable "short_name" {
  type        = string
  description = "Personlig kortnavn som holder ressursnavn unike i delt tenant"
}

variable "environment" {
  type        = string
  description = "Navnet på miljøet stacken tilhører (dev, test, prod)"
}

variable "location" {
  type        = string
  description = "Azure-regionen ressursene opprettes i"

  validation {
    condition     = contains(["northeurope", "uksouth", "westeurope", "norwayeast", "norwaywest"], var.location)
    error_message = "location må være en av de tillatte regionene i tenanten."
  }
}

variable "vnet_address_space" {
  type        = string
  description = "Adresserommet for miljøets VNET, oppgitt som én CIDR-blokk"
}

variable "subnets" {
  type        = map(number)
  description = "Subnett som skal opprettes: navn => netnum innenfor adresserommet"
}
