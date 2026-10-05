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

variable "tags" {
  type        = map(string)
  description = "Tags som skal legges på ressursene"
}

variable "vnet_address_space" {
  type        = string
  description = "Adresserommet for VNET-en, oppgitt som én CIDR-blokk"

  validation {
    condition     = can(cidrhost(var.vnet_address_space, 0))
    error_message = "vnet_address_space må være en gyldig CIDR-blokk."
  }
}

variable "subnets" {
  type        = map(number)
  description = "Subnett som skal opprettes: navn => netnum innenfor adresserommet"

  validation {
    condition     = length(var.subnets) > 0
    error_message = "Det må defineres minst ett subnett."
  }

  validation {
    condition     = alltrue([for netnum in values(var.subnets) : netnum >= 0 && netnum < 256])
    error_message = "netnum må være mellom 0 og 255 når newbits er 8."
  }
}
