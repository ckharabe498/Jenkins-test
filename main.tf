provider "azurerm" {
client_id = var.client_id
client_secret = var.client_secret
subscription_id = var.subscription_id
tenant_id = var.tenant_id

features {}
}

resource "azurerm_resource_group" "rg" {
    for_each              =   var.resource_group
    name                  =   each.key
    location              =   each.value
    tags                  =   var.tags
}
