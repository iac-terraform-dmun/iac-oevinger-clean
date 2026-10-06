terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

# Slår opp konteksten providereren er autentisert med, slik at utrullingen
# kan merkes med hvilket abonnement og hvilken tenant den faktisk havnet i.
data "azurerm_client_config" "current" {}

module "network" {
  source = "../modules/network"

  rg_name            = var.rg_name
  location           = var.location
  name_suffix        = var.name_suffix
  vnet_address_space = var.vnet_address_space
  subnets            = var.subnets
  tags               = var.common_tags
}

module "compute" {
  source = "../modules/compute"

  rg_name        = var.rg_name
  location       = var.location
  name_suffix    = var.name_suffix
  vm_size        = var.vm_size
  subnet_id      = module.network.subnet_ids[var.vm_subnet_key]
  admin_username = var.admin_username
  admin_ssh_key  = var.admin_ssh_key
  tags           = var.common_tags
}
