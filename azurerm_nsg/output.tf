output "nsg_ids_child" {
  value = {
    for k, v in azurerm_network_security_group.mynsg :
    k => v.id
  }
}