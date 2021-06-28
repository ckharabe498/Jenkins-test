variable "storage_account_name" {
  type = string
  default = "teststorage"
}

variable "resource_group_name" {
  type = string
  default = "testrg1"
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
  default = "lrs"
}

variable "tags" {
  type = map
  default = {
    env = "dev"
  }
}
