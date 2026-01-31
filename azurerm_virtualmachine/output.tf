output "vm_ids_child" {
  value = {
    for k, v in azurerm_linux_virtual_machine.testmachine :
    k => v.id
  }
}
