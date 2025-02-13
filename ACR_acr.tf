resource "azurerm_resource_group" "acr_resource_group" {
  name     = "${var.name}-rg"
  location = var.location

  tags = var.tags

}

#Create a new ACR using azurerm_container_registry
resource "azurerm_container_registry" "acr" {
  name                = "${var.name}azurecr"
  resource_group_name = azurerm_resource_group.acr_resource_group.name
  location            = azurerm_resource_group.acr_resource_group.location
  sku                 = "Standard"
  admin_enabled       = false

  tags = var.tags

}