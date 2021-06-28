resource_group_name = "bastionRG11"
location              =  "West Europe"
virtual_network =  {
        "name"              =       "Bastion-Vnet1"
        "address_range"     =       "10.10.0.0/16"
    }

subnet =  {
        "Subnet1b"          =       "10.10.1.0/24"
        "Subnet2b"          =       "10.10.2.0/24"
        "gatewaysubnet"     =       "10.10.3.0/24"
        "Subnet3b"          =       "10.10.4.0/24"
    }
tags   = {
        "environment" = "dev"
  }



