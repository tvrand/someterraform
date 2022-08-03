resource "azurerm_resource_group" "appgroup" {
	name = var.rsgroup_name
	location = "West Europe"
}

