resource "azurerm_network_interface" "mynic" {
    for_each = var.nic
    name                = each.value.nic_name
    location            = each.value.location
    resource_group_name = each.value.resource_group_name
    
    
    ip_configuration {
      name = each.value.ipconfname
      subnet_id = data.azurerm_subnet.datasub[each.key].id
      public_ip_address_id = data.azurerm_public_ip.datapub[each.key].id
      private_ip_address_allocation = each.value.private_ip_address_allocation
      
    }
  
}