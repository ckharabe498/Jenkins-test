variable "storage_account_name" {
  type = string
  default = "test-storage"
}

variable "resource_group_name" {
  type = string
}

variable "region" {
  type = string
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
  default = ""
}
variable "client_id" {}
variable "client_secret" {}
variable "subscription_id" {}
variable "tenant_id" {}
