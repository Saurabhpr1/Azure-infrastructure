output "nic_ids" {
  description = "Map of NIC IDs"
  value = {
    for k, v in azurerm_network_interface.mynic :
    k => v.id
  }
}
output "nic_names" {
  value = {
    for k, v in azurerm_network_interface.mynic :
    k => v.name
  }
}


