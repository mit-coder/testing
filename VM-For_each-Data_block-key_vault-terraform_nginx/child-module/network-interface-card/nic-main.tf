resource "azurerm_network_interface" "pro-nic" {

  for_each = var.azurerm_network_interface

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  ip_configuration {


    name                          = each.value.ip_configuration.name
    subnet_id                     = data.azurerm_subnet.data-sub[each.key].id
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
    public_ip_address_id          = data.azurerm_public_ip.data-pip[each.key].id

  }

}
data "azurerm_subnet" "data-sub" {
  for_each             = var.data-azurerm_subnet
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name

}
data "azurerm_public_ip" "data-pip" {
  for_each            = var.data-public-public_ip
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name

}




