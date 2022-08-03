resource "azurerm_network_security_group" "a15secgroup" {
  name                = var.secgroup_name
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_virtual_network" "a15vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}
resource "azurerm_subnet" "a15_sub" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.a15vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "main" {
  name                = "${var.nic_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "A1.5 config"
    subnet_id                     = azurerm_subnet.a15_sub.id
    private_ip_address_allocation = "Dynamic"
  }
}
