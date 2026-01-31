variable "RG" {
  description = "this variable is use for the parent module's resource group"
}
variable "Vnet" {
  description = "this variable is use for the parent module's virtual network"
}
variable "Subnet" {
  description = "this variable is use for the parent module's subnet"
}
variable "Publicip" {
  description = "this variable is use for the parent module's public ip"

}
variable "NIC" {
  description = "this variable is use for the network interface card"
}
variable "NSG" {
  description = "this variable is use for the network security group"
}
#--variable "nsgassction"{
#--description = "this variable is use for the subnet + network security group association"

#}

variable "VM" {
  description = "this variable is use for virtual machine module reference"
}
variable "vm_to_nic_map" {
  type        = map(string)
  description = "Map of VM key to NIC key"
}
