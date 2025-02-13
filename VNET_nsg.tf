#Creates a NSG using azurerm_network_security_group
#Associates NSG to subnets using azurerm_subnet_network_security_group_association

resource "azurerm_network_security_group" "nsg" {
  name                = "joshdevopsthehardway-nsg"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.resource_group.name
  tags                = var.tags
}

resource "azurerm_subnet_network_security_group_association" "aks_subnet" {
  subnet_id                 = azurerm_subnet.aks_subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_subnet_network_security_group_association" "app_gwsubnet" {
  subnet_id                 = azurerm_subnet.app_gwsubnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}