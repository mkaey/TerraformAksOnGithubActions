locals {
  storageName = "stterraformstate${var.postfix}"
}


resource "azurerm_resource_group" "storageRg" {
  name     = "rg-terraformstate"
  location = "West Europe"
}

resource "azurerm_storage_account" "storage" {
  name                = local.storageName
  resource_group_name = azurerm_resource_group.storageRg.name
  location            = azurerm_resource_group.storageRg.location

}

resource "azurerm_storage_container" "container" {
  name                 = "terraformstate"
  storage_account_name = azurerm_storage_account.storage.name
}
