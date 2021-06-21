#data "azurerm_subscription" "current" {}

resource "azurerm_policy_definition" "AZureBKPVMdef" {
  name         = "AzureBKPVMdefinition1"
  policy_type  = "Custom"
  mode         = "Indexed"
  description = "Ensure protection of your Azure Virtual Machines by enabling Azure Backup. Azure Backup is a secure and cost effective data protection solution for Azure"
  display_name = "CF: Azure Backup should be enabled for Virtual Machines"
  policy_rule = <<POLICY_RULE
   {
     "if": {
        "allOf": [
          {
            "field": "type",
            "equals": "Microsoft.Compute/virtualMachines"
          },
          {
            "field": "id",
            "notContains": "/resourceGroups/databricks-rg-"
          }
        ]
      },
      "then": {
        "effect": "[parameters('effect')]",
        "details": {
          "type": "Microsoft.RecoveryServices/backupprotecteditems"
        }
      }
    }

POLICY_RULE


  parameters = <<PARAMETERS
    {
      "effect": {
        "type": "String",
        "metadata": {
          "displayName": "Effect",
          "description": "Enable or disable the execution of the policy"
        },
        "allowedValues": [
          "AuditIfNotExists",
          "Disabled"
        ],
        "defaultValue": "AuditIfNotExists"
      }
    }
PARAMETERS

}


resource "azurerm_policy_assignment" "AzureBKPVMassignment" {
 name                 = "AZBKPVMpolicyassignment1"
  scope                = data.azurerm_subscription.current.id
  policy_definition_id = azurerm_policy_definition.AZureBKPVMdef.id
  description          = "CF:Azure Backup should be enabled for Virtual Machines"
  display_name         = "CF:Azure Backup should be enabled for Virtual Machines"

  metadata = <<METADATA
    {
    "category": "Backup"
    }
METADATA

 /* parameters = <<PARAMETERS
 {
  "effect": {
    "value": [ "AuditIfNotExists"]
  }
}
PARAMETERS */
}
