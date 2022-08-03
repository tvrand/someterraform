provider "azurerm" {
  features {}
}

module "resgroup" {
  source = "./modules/resgroup"
}

module "vnet" {
  source              = "./modules/vnet"
  resource_group_name = module.resgroup.name
  location            = module.resgroup.location
}

module "vms" {
  source              = "./modules/vms"
  resource_group_name = module.resgroup.name
  location            = module.resgroup.location
  net_interface_id    = module.vnet.nic_id
}
