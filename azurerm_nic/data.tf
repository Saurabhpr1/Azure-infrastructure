data "azurerm_subnet" "datasub" {
    for_each = var.nic
    name                 = each.value.datasubnet_name
    virtual_network_name = each.value.virtual_network_name
    resource_group_name  = each.value.resource_group_name
    }
data "azurerm_public_ip" "datapub" {
    for_each = var.nic
    name                = each.value.datapubip_name
    resource_group_name = each.value.resource_group_name
  
}