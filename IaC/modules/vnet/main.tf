locals {
  vnetName = "vnet-${var.postfix}"
}

resource "azurerm_resource_group" "vnetRg" {
  name     = "rg-vnet"
  location = "West Europe"
}

resource "azurerm_virtual_network" "vnet" {
  name = local.vnetName
  location = azurerm_resource_group.vnetRg.location
  resource_group_name = azurerm_resource_group.vnetRg.name
  address_space = [ "10.0.0.0/16" ]

  subnet {
    name           = "snet-aks"
    address_prefix = "10.0.0.0/24"
  }
}