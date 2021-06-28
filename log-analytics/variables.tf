variable "log_analytics_sku" {
  description = "Sets the Log Analytics workspace SKU. Possible values include: Free, Standard, PerGB2018"
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "Days to retain logs in Log Analytics"
  default     = "30"
}

variable "tags" {
  description = "Map of tags to add all network components"
  default     = {
    env= "dev"
  }
}

variable "region" {
  description = "The location/region where the resources will be created"
  default = "westeurope"
}

variable "name" {
description = "resource name"
  default = "test"
}
