terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

resource "azurerm_network_security_group" "nsg" {
  name                = format("nsg-%s", var.name_suffix)
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = format("vnet-%s", var.name_suffix)
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = [var.vnet_address_space]
  tags                = var.tags
}

# Ett subnett per nøkkel i subnett-mapet. Nøkkelen er identiteten, og netnum
# (verdien) bestemmer hvilken del av adresserommet subnettet får. Adressen
# regnes ut, slik at hele planen flytter seg hvis adresserommet endres.
resource "azurerm_subnet" "subnet" {
  for_each = var.subnets

  name                 = format("snet-%s-%s", var.name_suffix, each.key)
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [cidrsubnet(var.vnet_address_space, 8, each.value)]
}

# for_each kjøres over subnett-ressursen, ikke over variabelen på nytt,
# slik at koblingene alltid følger subnettene som faktisk finnes.
resource "azurerm_subnet_network_security_group_association" "snet_nsg" {
  for_each = azurerm_subnet.subnet

  subnet_id                 = each.value.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
