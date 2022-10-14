locals {
  aksName = "aks-${var.postfix}"
}

resource "azurerm_resource_group" "aksRg" {
  name     = "rg-aks"
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = local.aksName
  location            = azurerm_resource_group.aksRg.location
  resource_group_name = azurerm_resource_group.aksRg.name
  dns_prefix          = var.postfix

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2"
  }

  identity {
    type = "SystemAssigned"
  }
}