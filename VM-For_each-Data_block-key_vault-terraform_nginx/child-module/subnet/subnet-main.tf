resource "azurerm_subnet" "pro-subnet" {

  for_each = var.azurerm_subnet

  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes     = each.value.address_prefixes


}
