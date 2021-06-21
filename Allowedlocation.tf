data "azurerm_subscription" "current" {}

resource "azurerm_policy_definition" "Allowedlocationdef" {
  name         = "AllowedLocationdefinition1"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "CF:Allowed location North Europe and West Europe"

  policy_rule = <<POLICY_RULE
    {
    "if": {
        "allOf": [
          {
            "field": "location",
            "notIn": "[parameters('listOfAllowedLocations')]"
          },
          {
            "field": "location",
            "notEquals": "global"
          },
          {
            "field": "type",
            "notEquals": "Microsoft.AzureActiveDirectory/b2cDirectories"
          }
        ]
      },
      "then": {
        "effect": "deny"
        }
      }
POLICY_RULE


  parameters = <<PARAMETERS
    {
    "listOfAllowedLocations": {
      "type": "Array",
      "metadata": {
        "description": "The list of allowed locations for resources.",
        "displayName": "Allowed locations",
        "strongType": "location"
      }
    }
  }
PARAMETERS

}


resource "azurerm_policy_assignment" "Allowedlocationpolicyassignment" {
 name                 = "Allowedlocationpolicyassignment1"
  scope                = data.azurerm_subscription.current.id
  policy_definition_id = azurerm_policy_definition.Allowedlocationdef.id
  description          = "Allowed location North europe and West Europe"
  display_name         = "CF:Allowed Location Policy Assignment"

  metadata = <<METADATA
    {
    "category": "General"
    }
METADATA

  parameters = <<PARAMETERS
{
  "listOfAllowedLocations": {
    "value": [ 
        "West Europe",
        "North Europe"
         ]
  }
}
PARAMETERS
}
