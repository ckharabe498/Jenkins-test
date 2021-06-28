variable "storage_account_name" {
  type = string
  default = "test-storage"
}

variable "resource_group_name" {
  type = string
  default = "chetan"
}

variable "region" {
  type = string
   default = "West Europe"
}

variable "tier" {
  type = string
  default = "Standerd"
}

variable "account_replication_type" {
  type = string
  default = "Lrs"
}

variable "tags" {
  type = map
  default = {
    env = "dev"
  }
}
