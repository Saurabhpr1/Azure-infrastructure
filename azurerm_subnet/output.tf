output "subnet_names_child" {
  value = {
    for k, v in azurerm_subnet.mysub :
    k => v.name
  }
}
output "subnet_ids_child" {
  value = {
    for k, v in azurerm_subnet.mysub :
    k => v.id
  }
}
