resource "azurerm_resource_group" "resource_test_1" {
  name     = var.resource_name
  location = var.resouce_location
}

resource "azurerm_resource_group" "resource_test_6" {
  name     = var.resource_name
  location = var.resouce_location
}
