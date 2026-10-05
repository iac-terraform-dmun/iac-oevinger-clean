terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = format("rg-%s", local.name_suffix)
  location = var.location
  tags     = local.common_tags
}


module "network" {
  source      = "../../modules/network"
  rg_name     = azurerm_resource_group.rg.name
  location    = azurerm_resource_group.rg.location
  vnet_name   = format("vnet-%s", local.name_suffix)
  nsg_name    = format("nsg-%s", local.name_suffix)
  subnet_name = format("snet-%s", local.name_suffix)
  tags        = local.common_tags
}

module "compute" {
  source         = "../../modules/compute"
  rg_name        = azurerm_resource_group.rg.name
  location       = azurerm_resource_group.rg.location
  vm_size        = var.vm_size
  vm_name        = format("vm-%s", local.name_suffix)
  subnet_id      = module.network.subnet_id
  tags           = local.common_tags
  nic_name       = format("nic-%s", local.name_suffix)
  admin_username = var.admin_username
  admin_ssh_key  = var.admin_ssh_key
}