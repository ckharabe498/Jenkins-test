variable "vnet_names" {
  type        = list
  description = "Names of the both virtual networks peered provided in list format."
  default = ["Transit-VNET","Bastion-VNET"]
}

variable "resource_group_names" {
  type        = list
  description = "Names of both Resources groups of the respective virtual networks provided in list format"

  default = ["TransitRG1","Chetan"]
}

variable "subscription_ids" {
  type        = list
  description = "List of two subscription ID's provided in cause of allow_cross_subscription_peering set to true."
  default     = ["ee8aa0a4-4c95-4103-848b-bd6dbacf3e4e", "36aa8f0f-7654-4b5d-87f0-15b2561762b3"]
}

variable "allow_virtual_network_access" {
  description = "Controls if the VMs in the remote virtual network can access VMs in the local virtual network. Defaults to false."
  default     = false
  type        = bool
}

variable "allow_forwarded_traffic" {
  description = "Controls if forwarded traffic from VMs in the remote virtual network is allowed. Defaults to false."
  default     = true
  type        = bool
}

variable "allow_gateway_transit" {
  description = "Controls gatewayLinks can be used in the remote virtual network’s link to the local virtual network. Must be set to false for Global VNET peering."
  default     = true
  type        = bool
}

variable "use_remote_gateways" {
  description = "(Optional) Controls if remote gateways can be used on the local virtual network. If the flag is set to true, and allow_gateway_transit on the remote peering is also true, virtual network will use gateways of remote virtual network for transit. Defaults to false."
  default     = false
  type        = bool
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map

  default = {
    tag1 = ""
    tag2 = ""
  }
}

variable "tenant_id_1" {
  description  = "The ID for tenant 1"
  default      = "4fcd5940-f542-4829-a8c4-fa803d75c0f5"
}

variable "tenant_id_2" {
  description  = "The ID for tenant 2"
  default      = "8a8245b0-535f-411f-880a-2f51c3e2df96"
}

variable "client_id" {}
variable "client_secret" {}
