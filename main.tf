provider "azurerm" {
client_id = var.client_id
client_secret = var.client_secret
subscription_id = var.subscription_id
tenant_id = var.tenant_id

features {}
}

 module "azurerm_storage_account" {
  source                              = "./storage-account"

}
  module "azurerm_log_Analytics"{
  source = "./log-analytics"
}
   module "azurerm_resource_group"{
  source = "./RG"
}
   
variable "client_id" {}
variable "client_secret" {}
variable "subscription_id" {}
variable "tenant_id" {}
