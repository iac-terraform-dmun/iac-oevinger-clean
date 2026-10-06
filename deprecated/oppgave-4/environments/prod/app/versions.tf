terraform {
  required_version = ">= 1.9.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # Partial configuration: adressen kommer fra shared/backend.hcl og key fra
  # kommandolinja ved init. Backend-blokka kan ikke lese variabler eller locals.
  backend "azurerm" {}
}
