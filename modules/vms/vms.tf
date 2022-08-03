resource "azurerm_virtual_machine" "main" {
  name                  = "A1.5 VM"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = var.net_interface_id
  vm_size               = "Standard_DS1_v2"


  storage_os_disk {
    name              = "A1.5 disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
}
