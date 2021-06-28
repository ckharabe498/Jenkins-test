provider "azurerm" {
client_id = var.client_id
client_secret = var.client_secret
subscription_id = var.subscription_id
tenant_id = var.tenant_id

features {}
}

 resource "azurerm_resource_group" "rg1" {
  name     = "testrg1"
  location = "West Europe"
}

module "azurerm_storage_account" {
  source                              = "./storage-account"

}
variable "client_id" {}
variable "client_secret" {}
variable "subscription_id" {}
variable "tenant_id" {}
