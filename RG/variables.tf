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

