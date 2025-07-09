resource "azurerm_public_ip" "pubip"{
  name                = var.public_ip_name
  resource_group_name = var.public_rg_name
  location            = var.puclic_rg_location
  allocation_method   = "Static"

}


data "azurerm_subnet" "data_subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_net_name
  resource_group_name  = var.vmrg_name
}


resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.vmrg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pubip.id
  }
}



resource "azurerm_linux_virtual_machine" "VM" {
  name                = var.VM_name
  resource_group_name = var.vmrg_name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password = "user@123"
   disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

   os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

}

