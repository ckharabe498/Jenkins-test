 terraform {
    # This script has been tested and works fine with Terraform version above 1.0.0.
    required_version = "= 1.0.0"
}
provider "azurerm" {
client_id = var.client_id
client_secret = var.client_secret
subscription_id = var.subscription_id
tenant_id = var.tenant_id

features {}
}
 
  # Resource Group creation
 resource "azurerm_resource_group" "rg" {
 name = var.resource_group_name
 location = var.location
 }

  # VNet creation
resource "azurerm_virtual_network" "vnet" {
  resource_group_name   =   azurerm_resource_group.rg.name
  name                  =   var.virtual_network["name"]
  location              =   azurerm_resource_group.rg.location
  address_space         =   [var.virtual_network["address_range"]]
  tags                  =   var.tags
}

  # Subnet creation for the VNet
resource "azurerm_subnet" "sn" {
   for_each             =   var.subnet
   name                 =   each.key
   resource_group_name  =   azurerm_resource_group.rg.name
   virtual_network_name =   azurerm_virtual_network.vnet.name
   address_prefixes     =   [each.value]
}

  # Network security group creation
resource "azurerm_network_security_group" "nsg" {
    
   for_each = {
    for s in keys(var.subnet) : s => var.subnet[s]
    if s != "gatewaysubnet"
  }

  name                 =   "${each.key}-NSG"
  location             =   azurerm_resource_group.rg.location
  resource_group_name  =   azurerm_resource_group.rg.name
}

  # Network security group & subnet association
resource "azurerm_subnet_network_security_group_association" "subnetsg" {
   for_each = {
    for s in keys(var.subnet) : s => var.subnet[s]
    if s != "gatewaysubnet"
  }

subnet_id               = azurerm_subnet.sn[each.key].id
network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}
