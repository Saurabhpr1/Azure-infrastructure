output "public_ip_names" {
  description = "Map of Public IP names"
  value = {
    for k, v in azurerm_public_ip.mypub :
    k => v.name
  }
}