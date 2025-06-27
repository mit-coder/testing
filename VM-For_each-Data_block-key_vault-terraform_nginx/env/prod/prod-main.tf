module "resource_group-module" {
  source                 = "../../child-module/resource-group"
  azurerm_resource_group = var.resource_group


}
module "vnet-module" {

  source                  = "../../child-module/virtual-network"
  azurerm_virtual_network = var.virtual_network
  depends_on              = [module.resource_group-module]

}
module "subnet-module" {
  source         = "../../child-module/subnet"
  azurerm_subnet = var.subnet
  depends_on     = [module.vnet-module]

}
module "pip-module" {
  source            = "../../child-module/public-ip"
  azurerm_public_ip = var.public_ip
  depends_on        = [module.resource_group-module]

}
module "nic-module" {
  source                    = "../../child-module/network-interface-card"
  azurerm_network_interface = var.network_interface
  depends_on                = [module.pip-module, module.subnet-module]
  data-azurerm_subnet       = var.data-azurerm_subnet
  data-public-public_ip     = var.data-public-public_ip
}
module "vm-module" {
    source = "../../child-module/virtual-machine"
    azurerm_linux_virtual_machine = var.linux_virtual_machine
    depends_on = [ module.nic-module ]
    linux_virtual_machine_data = var.linux_vm
    key-vault = var.key-vault-name
    key-vault-username = var.key-vault-username
    key-vault-password = var.key-vault-password

}
# module "nsg-module" {
#   source = "../../child-module/NSG"
#   depends_on = [ module.vm-module ]
#   nsg = var.nsg

  
# }
