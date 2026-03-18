output "vnet_name_from_module" {
  value = module.virtualnetwork.vnet_name

}  
output "vnet_id_from_module" {
  value = module.virtualnetwork.virtual_network_ids["vnet1"] // iska matlab virtualnetwork module ke andar virtual_network_ids map se vnet1 ka id le raha hai  {sirf vnet1 ka output de ga yhan vnet1 key h tfvars me}

}
output "subnetname" {
  value = module.subnet.subnet_names_child["subnet1"] // output ka syntax module.module_name.output_name for child module


}
output "subnetid" {
  value = module.subnet.subnet_ids_child["subnet1"]

}

output "nic_name_from_module" {
  value = module.networkinterface.nic_names["nic1"]

}
output "nic_ids_from_module" {
  value = module.networkinterface.nic_ids["nic1"]

}
output "public_ip_name_from_module" {
  value = module.Public.public_ip_names["publicip1"]


}
output "nsg_ids_from_module" {
  value = module.Nsg.nsg_ids_child["nsg1"]
}
