locals {
  logAnalyticsName = "vnet-${var.postfix}"
}

resource "azurerm_resource_group" "monitorRg" {
  name     = "rg-monitor"
  location = "West Europe"
}

resource "azurerm_log_analytics_workspace" "logAnalytics" {
  name                = local.logAnalyticsName
  resource_group_name = azurerm_resource_group.monitorRg.name
  location            = azurerm_resource_group.monitorRg.location
  sku                 = "PerGB2018"
}
