resource "azurerm_virtual_network" "Vnet_test" {
  name                = var.virtual_network_name
  resource_group_name = var.vnet_resource_group 
  location            = var.vnet_location
  address_space = var.vent_address_prefix
  
}
  

