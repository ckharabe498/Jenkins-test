#data "azurerm_subscription" "current" {}

resource "azurerm_policy_definition" "notallowedresdef" {
  name         = "NotAllowedResourceefinition1"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "CF: Not allowed resource types"

  policy_rule = <<POLICY_RULE
   {
      "if": {
        "allOf": [
          {
            "field": "type",
            "in": "[parameters('listOfResourceTypesNotAllowed')]"
          },
          {
            "value": "[field('type')]",
            "exists": true
          }
        ]
      },
      "then": {
        "effect": "[parameters('effect')]"
      }
    }
POLICY_RULE


  parameters = <<PARAMETERS
    {
      "listOfResourceTypesNotAllowed": {
        "type": "Array",
        "metadata": {
          "description": "The list of resource types that cannot be deployed.",
          "displayName": "Not allowed resource types",
          "strongType": "resourceTypes"
        }
      },
      "effect": {
        "type": "String",
        "metadata": {
          "displayName": "Effect",
          "description": "Enable or disable the execution of the policy"
        },
        "allowedValues": [
          "Audit",
          "Deny",
          "Disabled"
        ],
        "defaultValue": "Deny"
      }
    }
PARAMETERS

}


resource "azurerm_policy_assignment" "notallowedrespolicyassignment" {
 name                 = "Notallowedrespolicyassignment1"
  scope                = data.azurerm_subscription.current.id
  policy_definition_id = azurerm_policy_definition.notallowedresdef.id
  description          = "Not allowed resource types"
  display_name         = "CF: Not allowed resource types"

  metadata = <<METADATA
    {
    "category": "General"
    }
METADATA

parameters = <<PARAMETERS
{
  "listOfResourceTypesNotAllowed": {
    "value": [ "billingAccounts"]
  }
}
PARAMETERS 
}
