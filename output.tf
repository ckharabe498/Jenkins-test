output "resource-group-name" {
    description     =   "Name of the resource group"
    value           =   azurerm_resource_group.rg.name
}

output "resource-group-location" {
    description     =   "Location of the resource group"
    value           =   azurerm_resource_group.rg.location
}

output "vnet" {
    description =   "Vnet name and Vnet Address Space"
    value       =    {
        "Vnet_Name"     =   azurerm_virtual_network.vnet.name 
        "Vnet_Address"  =   azurerm_virtual_network.vnet.address_space  
    }
}

output "subnet" {
    description =   "subnet name & its address_prefix"
    value       =  { for s in azurerm_subnet.sn: s.name => s.address_prefixes }
}

output "nsg" {
    description =   "Name of the Network Security Group (NSG) and its location"
    value       =   { for n in azurerm_network_security_group.nsg: n.name => n.location}
}

