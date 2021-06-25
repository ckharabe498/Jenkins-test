#######################################################

output "log_analytics_resource_id" {
  description = "Azure Log Analytics resource ID"
  value       = azurerm_log_analytics_workspace.general.id
}

output "log_analytics_workspace_id" {
  description = "Azure Log Analytics workspace ID"
  value       = azurerm_log_analytics_workspace.general.workspace_id
}

output "log_analytics_workspace_name" {
  description = "Azure Log Analytics workspace Name"
  value       = azurerm_log_analytics_workspace.general.name
}

output "log_analytics_primary_shared_key" {
  description = "Azure Log Analytics workspace primary shared key"
  value       = azurerm_log_analytics_workspace.general.primary_shared_key
  sensitive = true
}
