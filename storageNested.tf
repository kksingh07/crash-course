resource "azurerm_storage_account" "TCS-storacc-block" {
  depends_on = [azurerm_resource_group.Infy-rg-block]
  for_each   = var.Nested_map_storageAccount

  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}


resource "azurerm_storage_account" "Hitachi-storacc-block" {
  name                     = "hitachistoraccblock"
  resource_group_name      = azurerm_resource_group.Infy-rg-block.name
  location                 = azurerm_resource_group.Infy-rg-block.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}
resource "azurerm_storage_container" "Hitachi-container-block" {
  depends_on = [azurerm_storage_account.Hitachi-storacc-block]

  for_each              = var.Nested_Map_BlobContainer
  name                  = each.value.name
  storage_account_id    = azurerm_storage_account.Hitachi-storacc-block.id
  container_access_type = each.value.container_access_type

}
