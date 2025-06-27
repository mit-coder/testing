resource_group = {
  rg1 = {
    name     = "todo-app-rg"
    location = "westus"
  }

}
virtual_network = {
  vnet1 = {
    name                = "todo-app-vnet"
    resource_group_name = "todo-app-rg"
    location            = "westus"
    address_space       = ["10.0.0.0/20"]
  }
}
subnet = {
  subnet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "todo-app-rg"
    virtual_network_name = "todo-app-vnet"
    address_prefixes     = ["10.0.1.0/25"]
  }
   subnet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "todo-app-rg"
    virtual_network_name = "todo-app-vnet"
    address_prefixes     = ["10.0.2.0/25"]
  }
}
public_ip = {
  pip1 = {
    name                = "frontend-pip"
    resource_group_name = "todo-app-rg"
    location            = "westus"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "backend-pip"
    resource_group_name = "todo-app-rg"
    location            = "westus"
    allocation_method   = "Static"
  }
}
network_interface = {
  nic1 = {
    name                = "frontend-nic"
    resource_group_name = "todo-app-rg"
    location            = "westus"
    ip_configuration = {
      name                          = "frontend-nic-config"
      private_ip_address_allocation = "Dynamic"
    }

  }
  nic2 = {
    name                = "backend-nic"
    resource_group_name = "todo-app-rg"
    location            = "westus"
    ip_configuration = {
      name                          = "backend-nic-config"
      private_ip_address_allocation = "Dynamic"
    }

  }
}

data-azurerm_subnet = {
  nic1 = {
    subnet_name          = "frontend-subnet"
    virtual_network_name = "todo-app-vnet"
    resource_group_name  = "todo-app-rg"
  }
  nic2 = {
    subnet_name          = "backend-subnet"
    virtual_network_name = "todo-app-vnet"
    resource_group_name  = "todo-app-rg"
  }
}

data-public-public_ip = {
  nic1 = {
    public_ip_name      = "frontend-pip"
    resource_group_name = "todo-app-rg"
  }
  nic2 = {
    public_ip_name      = "backend-pip"
    resource_group_name = "todo-app-rg"
  }
}

linux_virtual_machine = {
  vm1 = {
    name                 = "frontend-vm"
    resource_group_name  = "todo-app-rg"
    location             = "westus"
    size                 = "Standard_B1s"
    # admin_username       = "Mituser"
    # admin_password       = "Password@123"

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
  vm2 = {
    name                 = "backend-vm"
    resource_group_name  = "todo-app-rg"
    location             = "westus"
    size                 = "Standard_B1s"
    # admin_username       = "Mituser11"
    # admin_password       = "Password@123"

    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}

linux_vm = {
  vm1 = {
    network_interface_name = "frontend-nic"
    resource_group_name    = "todo-app-rg"
  }
  vm2 = {
    network_interface_name = "backend-nic"
    resource_group_name    ="todo-app-rg"
  }
}

key-vault-name = {
  vm1 = {
    name = "mit-key-vault"
    resource_group_name = "mit-rg"
  }
  vm2 = {
    name = "mit-key-vault"
    resource_group_name = "mit-rg"
  }
}

key-vault-username = {
  vm1 = {
    name = "user-name"
  }
  vm2 = {
    name = "user-name"
  }
}

key-vault-password = {
  vm1 = {
    name = "vmpassword"
  }
  vm2 = {
    name = "vmpassword"
  }
}
# nsg = {
#   subnet1 = {
#     name                = "nsg-for-subnet1"
#     resource_group_name = "todo-app-rg"
#     location            = "westus"
#     security_rule = {
#       name = "subnet1-rule"
#       priority = "100"
#       direction = "Inbound"
#       access = "Allow"
#       protocol = "Tcp"
#       source_port_range = "*"
#       destination_port_ranges = "*"
#       source_address_prefix = "*"
#       destination_address_prefix = ["10.0.1.0/25"]
#     }

#     }
#     subnet2 = {
#     name                = "nsg-for-subnet2"
#     resource_group_name = "todo-app-rg"
#     location            = "westus"
#     security_rule = {
#       name = "subnet2-rule"
#       priority = "101"
#       direction = "Inbound"
#       access = "Allow"
#       protocol = "Tcp"
#       source_port_range = "*"
#       destination_port_ranges = "*"
#       source_address_prefix = "*"
#       destination_address_prefix = ["10.0.2.0/25"]
#     }

#     }
#   }





