module "resource" {
  source = "../../azurerm_resource"
  rg     = var.RG
}
module "virtualnetwork" {
  depends_on = [module.resource]
  source     = "../../azurerm_virtualnetwork"
  vnet       = var.Vnet
}
module "subnet" {
  depends_on = [module.virtualnetwork]
  source     = "../../azurerm_subnet"
  subnet     = var.Subnet
}
module "Public" {
  depends_on = [module.subnet]
  source     = "../../azurerm_publicip"
  public     = var.Publicip
}
module "networkinterface" {
  depends_on = [module.Public]
  source     = "../../azurerm_nic"
  nic        = var.NIC
}
module "Nsg" {
  depends_on = [module.networkinterface]
  source     = "../../azurerm_nsg"
  nsg_child  = var.NSG

}
#---local for subnet + nsg association ---

locals {
  nsgassociation = {
    for k in keys(module.subnet.subnet_ids_child) :
    k => {
      subnet_id = module.subnet.subnet_ids_child[k]
      nsg_id    = module.Nsg.nsg_ids_child["nsg1"]
    }
  }
}

#--- subnet + nsg association ---
resource "azurerm_subnet_network_security_group_association" "nsgassoc" {
  for_each                  = local.nsgassociation
  subnet_id                 = each.value.subnet_id
  network_security_group_id = each.value.nsg_id
}
#--- local for vm to nic id mapping ---
locals {
  vm_to_nic_id = {
    for vm_key, nic_key in var.vm_to_nic_map :
    vm_key => module.networkinterface.nic_ids[nic_key]
  }
}

module "Vmmachine" {
  depends_on    = [azurerm_subnet_network_security_group_association.nsgassoc]
  source        = "../../azurerm_virtualmachine"
  vm_machine    = var.VM
  nic_ids_child = local.vm_to_nic_id
}