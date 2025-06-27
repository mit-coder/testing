# Resource Group
resource "azurerm_resource_group" "mit-rg" {
  name     = "charli"
  location = "centralus"
}

# Virtual Network
resource "azurerm_virtual_network" "mit-vnet" {
  name                = "charli-vnet"
  resource_group_name = azurerm_resource_group.mit-rg.name
  location            = azurerm_resource_group.mit-rg.location
  address_space       = ["10.0.0.0/20"]
}

# Subnet
resource "azurerm_subnet" "mit-subnet" {
  name                 = "vm-subnet1"
  resource_group_name  = azurerm_resource_group.mit-rg.name
  virtual_network_name = azurerm_virtual_network.mit-vnet.name
  address_prefixes     = ["10.0.1.0/26"]
}

# Public IP
resource "azurerm_public_ip" "vm-pip" {
  name                = "vm-public-ip"
  location            = azurerm_resource_group.mit-rg.location
  resource_group_name = azurerm_resource_group.mit-rg.name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}

# Network Interface
resource "azurerm_network_interface" "vm-nic" {
  name                = "vm-nic-card"
  resource_group_name = azurerm_resource_group.mit-rg.name
  location            = azurerm_resource_group.mit-rg.location

  ip_configuration {
    name                          = "nic-ipconfig"
    subnet_id                     = azurerm_subnet.mit-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm-pip.id
  }

  depends_on = [azurerm_public_ip.vm-pip] # extra safety
}

# Linux VM
resource "azurerm_linux_virtual_machine" "vm-vm" {
  name                  = "vm-fadu"
  resource_group_name   = azurerm_resource_group.mit-rg.name
  location              = azurerm_resource_group.mit-rg.location
  network_interface_ids = [azurerm_network_interface.vm-nic.id]

  size                            = "Standard_B1s"
  admin_username                  = "azurerm"
  admin_password                  = "Azurerm@111"
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "fadu-os-disk"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  depends_on = [azurerm_network_interface.vm-nic] # extra safety
}