data "azurerm_network_interface" "data-vm-nic" {
  for_each = var.linux_virtual_machine_data
  name                = each.value.network_interface_name
  resource_group_name = each.value.resource_group_name

}

data "azurerm_key_vault" "kv" {
  for_each = var.key-vault
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  
}
data "azurerm_key_vault_secret" "kv-user" {
  for_each = var.key-vault-username
  name = each.value.name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
  
}
data "azurerm_key_vault_secret" "kv-pass" {
  for_each = var.key-vault-password
  name = each.value.name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
  
}
