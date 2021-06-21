#data "azurerm_subscription" "current" {}

resource "azurerm_policy_definition" "LogAnalyticsAgentVM" {
  name         = "LogAnalyticsAgentVM1"
  policy_type  = "Custom"
  mode         = "Indexed"
  description = " This policy audits any Windows/Linux virtual machines if the Log Analytics agent is not installed."
  display_name = "CF:The Log Analytics agent should be installed on virtual machines"
  policy_rule = <<POLICY_RULE
   {
    "if": {
        "field": "type",
        "equals": "Microsoft.Compute/virtualMachines"
      },
      "then": {
        "effect": "[parameters('effect')]",
        "details": {
          "type": "Microsoft.Compute/virtualMachines/extensions",
          "existenceCondition": {
            "allOf": [
              {
                "field": "Microsoft.Compute/virtualMachines/extensions/publisher",
                "equals": "Microsoft.EnterpriseCloud.Monitoring"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/extensions/type",
                "in": [
                  "MicrosoftMonitoringAgent",
                  "OmsAgentForLinux"
                ]
              },
              {
                "field": "Microsoft.Compute/virtualMachines/extensions/provisioningState",
                "equals": "Succeeded"
              },
              {
                "field": "Microsoft.Compute/virtualMachines/extensions/settings.workspaceId",
                "exists": "true"
              }
            ]
          }
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


resource "azurerm_policy_assignment" "LogAnalyticsVMagentassignment" {
name                 = "LogAnalyticsVMagentassignment1"
  scope                = data.azurerm_subscription.current.id
  policy_definition_id = azurerm_policy_definition.LogAnalyticsAgentVM.id
  description          = "CF:The Log Analytics agent should be installed on virtual machines"
  display_name         = "CF:The Log Analytics agent should be installed on virtual machines"

  metadata = <<METADATA
    {
    "category": "Monitoring"
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
