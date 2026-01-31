output "vnet_name" {
  value = azurerm_virtual_network.myvnet
}

output "virtual_network_ids" {
  value = {
    for k, v in azurerm_virtual_network.myvnet :     # yahan k ka matlab hai key aur v ka matlab hai value jaise key = vnet1 , value = resource object
    k => v.id
  }
}