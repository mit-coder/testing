resource "azurerm_virtual_network" "pro-vnet" {

  for_each = var.azurerm_virtual_network

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  address_space       = each.value.address_space

}
