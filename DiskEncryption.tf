#data "azurerm_subscription" "current" {}

resource "azurerm_policy_definition" "DiscEncDef" {
  name         = "DiskEncryptiondefinition1"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "CF: Disk Encryption"
  description = "Virtual machines without an enabled disk encryption will be monitored by Azure Security Center as recommendations."
  policy_rule = <<POLICY_RULE
    {
    "if": {
        "field": "type",
        "in": ["Microsoft.ClassicCompute/virtualMachines",
          "Microsoft.Compute/virtualMachines"]
    },
    "then":  {
        "effect": "[parameters('effect')]",
        "details": {
          "type": "Microsoft.Security/assessments",
          "name": "d57a4221-a804-52ca-3dea-768284f06bb7",
          "existenceCondition": {
            "field": "Microsoft.Security/assessments/status.code",
            "in": [
              "NotApplicable",
              "Healthy"
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


resource "azurerm_policy_assignment" "Diskencassignment" {
  name                 = "Diskencassignment1"
  scope                = data.azurerm_subscription.current.id
  policy_definition_id =  azurerm_policy_definition.DiscEncDef.id
  description          = "Disk Encryption should Apply on VM"
  display_name         = "CF:Disk Encryption should Apply on VM"

  metadata = <<METADATA
    {
    "category": "General"
    }
METADATA

/*parameters = <<PARAMETERS
{
  "effect": {
    "value": [ "AuditIfNotExists" ]
  }
}
PARAMETERS*/
}
