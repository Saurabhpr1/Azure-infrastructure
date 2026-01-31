resource "azurerm_public_ip" "mypub" {
  for_each = var.public
  name = each.value.public_ip_name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method = each.value.allocation_method
  sku = each.value.sku
}