RG = {
  rg1 = {
    name     = "dev-rgtest"
    location = "west us"
  }
}
Vnet = {
  vnet1 = {
    vnet_name           = "dev-testvnet"
    address_space       = ["10.0.0.0/16"]
    location            = "west us"
    resource_group_name = "dev-rgtest"
  }
}
Subnet = {
  subnet1 = {
    subnet_name          = "dev-testsubnet"
    resource_group_name  = "dev-rgtest"
    virtual_network_name = "dev-testvnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
}
Publicip = {
  publicip1 = {
    public_ip_name      = "dev-testpublicip"
    location            = "west us"
    resource_group_name = "dev-rgtest"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}
NIC = {
  nic1 = {
    datasubnet_name               = "dev-testsubnet"
    virtual_network_name          = "dev-testvnet"
    datapubip_name                = "dev-testpublicip"
    nic_name                      = "dev-testnic"
    location                      = "west us"
    resource_group_name           = "dev-rgtest"
    ipconfname                    = "dev-ipconfig1"
    private_ip_address_allocation = "Dynamic"
  }
}
NSG = {
  nsg1 = {
    nsg_name            = "dev-testnsg"
    location            = "west us"
    resource_group_name = "dev-rgtest"
  }
}
VM = {
  vm1 = {
    vm_name                      = "dev-testvm"
    resource_group_name          = "dev-rgtest"
    location                     = "west us"
    vm_size                      = "Standard_D2s_v3"
    admin_username               = "azureuser"
    admin_password               = "Passwod1234!"
    os_disk_caching              = "ReadWrite"
    os_disk_storage_account_type = "Standard_LRS"
    source_image_publisher       = "Canonical"
    source_image_offer           = "UbuntuServer"
    source_image_sku             = "18.04-LTS"
    source_image_version         = "latest"
} }

vm_to_nic_map = {
  vm1 = "nic1"
}
