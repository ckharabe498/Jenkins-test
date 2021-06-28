
resource "azurerm_storage_account" "storage" {
  name                     = "test-storage"
  resource_group_name      = "yogesh"
  location                 = "West Europe"
  account_tier             = "standerd"
  account_replication_type = "lsr"
  tags = {
    env= "prod"
  }
}
