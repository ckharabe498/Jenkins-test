provider "azurerm" {
client_id = var.client_id
client_secret = var.client_secret
subscription_id = var.subscription_id
tenant_id = var.tenant_id

features {}
}

 resource "azurerm_resource_group" "storage" {
  name     = "chetan"
  location = "West Europe"
}

module "azurerm_storage_account" {
  source                              = "./storage-account"
storage_account_name = var.storage_account_name
resource_group_name = var.resource_group_name
region = var.region
tier = var.tier
account_replication_type = var.account_replication_type
tags = var.tags

}
variable "client_id" {}
variable "client_secret" {}
variable "subscription_id" {}
variable "tenant_id" {}
