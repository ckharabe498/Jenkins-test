variable "storage_account_name" {
  type = string
  default = "test-storage"
}

variable "resource_group_name" {
  type = string
  default = "yogesh"
}

variable "region" {
  type = string
  default = "west europe"
}

variable "tier" {
  type = string
  default = ""
}

variable "account_replication_type" {
  type = string
}

variable "tags" {
  type = map

}
variable "client_id" {}
variable "client_secret" {}
variable "subscription_id" {}
variable "tenant_id" {}
