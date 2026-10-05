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

module "stack" {
  source = "../../stacks"

  rg_name            = azurerm_resource_group.rg.name
  location           = azurerm_resource_group.rg.location
  name_suffix        = local.name_suffix
  common_tags        = local.common_tags
  vnet_address_space = var.vnet_address_space
  subnets            = var.subnets
  vm_subnet_key      = var.vm_subnet_key
  vm_size            = var.vm_size
  admin_username     = var.admin_username
  admin_ssh_key      = var.admin_ssh_key
}
