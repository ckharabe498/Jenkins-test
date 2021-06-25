provider "azurerm" {
client_id = var.client_id
client_secret = var.client_secret
subscription_id = var.subscription_id
tenant_id = var.tenant_id

features {}
}

 resource "azurerm_resource_group" "storage" {
  name     = "Yogesh"
  location = "WestEurope"
}

resource "azurerm_storage_account" "storage1" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.region
  account_tier             = var.tier
  account_replication_type = var.account_replication_type
  tags = var.tags
}
