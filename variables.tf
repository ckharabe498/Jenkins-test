variable "storage_account_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "region" {
  type = string
}

variable "tier" {
  type = string
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
