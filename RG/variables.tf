variable "resource_group" {
    description     =       "Create multiple resource groups"
    type            =       map(string)
    default         =       {
        "Shreyesh1" =       "West Europe"
        "Chetan"    =       "West Europe"
        "Yogesh"    =       "West Europe"
    }
}
variable "tags" {
  description = "Creating Tags"
  type = map(string)
  default = {
    "environment" = "dev"
  }
}

variable "client_id" {}
variable "client_secret" {}
variable "subscription_id" {}
variable "tenant_id" {}
