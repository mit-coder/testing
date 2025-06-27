resource "azurerm_linux_virtual_machine" "pro-vm" {

  for_each = var.azurerm_linux_virtual_machine

  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  network_interface_ids = [data.azurerm_network_interface.data-vm-nic[each.key].id]


  size                            = each.value.size
  admin_username                  = data.azurerm_key_vault_secret.kv-user[each.key].value
  admin_password                  = data.azurerm_key_vault_secret.kv-pass[each.key].value
  disable_password_authentication = false


  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
  custom_data = base64encode(<<EOF
#!/bin/bash
apt-get update
apt-get install nginx -y
systemctl enable nginx
systemctl start nginx

EOF
)
}





