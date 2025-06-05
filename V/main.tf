resource "azurerm_resource_group" "Thrall" {
   location = "West Europe"
   name = "Thrall"
    tags = { owner = "valentin.gheorghiu@redbull.com"}
}
# Virtual Network
resource "azurerm_virtual_network" "Cip_Net" {
  name                = "Cip_Net"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.Thrall.name
  resource_group_name = azurerm_resource_group.Thrall.name
}
 
# Subnet 1
resource "azurerm_subnet" "Orgrimmar" {
  name                 = "Orgrimmar"
  resource_group_name  = azurerm_resource_group.Thrall.name
  virtual_network_name = azurerm_virtual_network.Thrall.name
  address_prefixes     = ["10.0.6.0/24"]
}