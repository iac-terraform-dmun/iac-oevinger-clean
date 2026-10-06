provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Nettverks-stacken eier ressursgruppa: den rulles ut først og rives sist.
resource "azurerm_resource_group" "rg" {
  name     = format("rg-%s", local.name_suffix)
  location = var.location
  tags     = local.common_tags
}

module "network" {
  source = "../../../modules/network"

  rg_name            = azurerm_resource_group.rg.name
  location           = azurerm_resource_group.rg.location
  name_suffix        = local.name_suffix
  vnet_address_space = var.vnet_address_space
  subnets            = var.subnets
  tags               = local.common_tags
}
