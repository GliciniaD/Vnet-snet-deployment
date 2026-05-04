resource "azurerm_resource_group" "rg" {
  for_each = var.vnet_resource
  name     = each.value.rg_name
  location = "UK South"
}

resource "azurerm_virtual_network" "example" {
  for_each  = var.vnet_resource
  name                = each.value.vnet_name
  location            = azurerm_resource_group.rg[each.key].location
  resource_group_name = azurerm_resource_group.rg[each.key].name
  address_space       = "10.0.0.0/16"

  subnet {
    name             = each.value.snet_name1
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name             = each.value.snet_name2
    address_prefix = "10.0.2.0/24"
  }
}