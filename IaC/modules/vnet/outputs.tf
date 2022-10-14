output "vnetId" {
  value = azurerm_virtual_network.vnet.id
}

output "podSubnetId" {
  value = azurerm_virtual_network.vnet.subnet.*.id[0]
}

output "nodeSubnetId" {
  value = azurerm_virtual_network.vnet.subnet.*.id[1]
}
