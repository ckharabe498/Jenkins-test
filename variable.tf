variable "resource_group_name" {
  description     =       "Name of the Resource Group to be created"
  type            =       string

}
# - Location Variables
variable "location" {
  description     =       "Location/region where the VNet will be created (for a list of regions see https://azure.microsoft.com/regions) "
  type            =       string

}
# - VNET Variables

variable "virtual_network" {
    description     =       "Name & List of address space (in CIDR notation) assigned to the VNet"
    type            =       map(string)
}

# - Subnet Variables

variable "subnet" {
    description     =       "Name & List of address space (in CIDR notation) assigned to the subnet"
    type            =       map(string)
    }


variable "tags" {
  description = "Map the tags to all network components"
  type = map(string)
  }