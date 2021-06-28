
resource "azurerm_storage_account" "storage" {
  name                     = "test-storage"
  resource_group_name      = "yogesh"
  location                 = "West Europe"
  account_tier             = "standerd"
  account_replication_type = "lsr"
  tags = {
    env= "prod"
  }
}
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
  default = "standerd"
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