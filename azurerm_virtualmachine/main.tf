resource "azurerm_linux_virtual_machine" "testmachine" {
    for_each = var.vm_machine
    name =each.value.vm_name
    resource_group_name = each.value.resource_group_name
    location = each.value.location
    size = each.value.vm_size
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
    disable_password_authentication = false
    #---network_interface_ids = [ var.nic_ids_child[each.key] ]
    network_interface_ids = [
  var.nic_ids_child[each.key]
]


    os_disk {
      caching = each.value.os_disk_caching
      storage_account_type = each.value.os_disk_storage_account_type
    }
    source_image_reference {
        publisher = each.value.source_image_publisher
        offer     = each.value.source_image_offer
        sku       = each.value.source_image_sku
        version   = each.value.source_image_version
  }
}

