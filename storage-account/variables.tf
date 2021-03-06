variable "storage_account_name" {
  type = string
  default = "cbzyst745"
}

variable "resource_group_name" {
  type = string
  default = "chetan"
}

variable "region" {
  type = string
   default = "westeurope"
}

variable "tier" {
  type = string
  default = "Standard"
}

variable "account_replication_type" {
  type = string
  default = "LRS"
}

variable "tags" {
  type = map
  default = {
    env = "dev"
  }
}
