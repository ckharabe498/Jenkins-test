
resource "azurerm_log_analytics_workspace" "general" {
  name                = "${var.name}-WS"
  location            = var.region
  resource_group_name = azurerm_resource_group.larg.name
  retention_in_days   = var.retention_in_days
  sku                 = var.log_analytics_sku

  tags = var.tags
}

resource "azurerm_resource_group" "larg" {
  name     = "${var.name}-RG"
  location = var.region

  tags = var.tags
}
