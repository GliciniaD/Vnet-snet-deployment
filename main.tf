resource "azurerm_resource_group" "rg" {
  for_each = var.storage_accounts
  name     = each.value.rg_name
  location = "UK South"
}

resource "azurerm_storage_account" "storage" {
  for_each                 = var.storage_accounts
  name                     = each.value.storage_name
  resource_group_name      = azurerm_resource_group.rg[each.key].name
  location                 = azurerm_resource_group.rg[each.key].location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
