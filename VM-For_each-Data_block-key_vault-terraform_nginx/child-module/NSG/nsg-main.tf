resource "azurerm_network_security_group" "nsg" {
    for_each = var.nsg
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  security_rule  {
    name = each.value.name
    priority = each.value.priority
    direction = each.value.direction
    access = each.value.access
    protocol = each.value.protocol
    source_port_range = each.value.source_port_range
    destination_port_ranges = each.value.destination_port_ranges
    source_address_prefix = each.value.source_address_prefix
    destination_address_prefix = each.value.destination_address_prefix
    
  }
  
}