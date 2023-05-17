resource "azurerm_service_plan" "ASP" {
  name                = var.ASP_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.sku_namesize
  capacity            = var.capacity
  os_type = var.os_type
}


resource "azurerm_windows_web_app" "webapp" {
  name = var.webapp_name
  location = var.location
  service_plan_id = var.azurerm_service_plan.id
  site_config {
    always_on = true
    http2_enabled = true
    minimum_tls_version = "1.2"
    application_stack {
      current_stack = dotnet
      dotnet_version = "v4.0"
    }
  }
  client_affinity_enabled = true
  https_only = true
  identity {
    type = "SystemAssigned"
  }

  depends_on = [ azurerm_service_plan.ASP ]
}