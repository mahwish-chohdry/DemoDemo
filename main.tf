terraform {

backend "azurerm"{}
}
provider "azurerm" {
  # Configuration options
  features{}
}

resource "azurerm_resource_group" "rg" {
  name     = "RG-TF-Testing"
  location = "eastus"
  }

  resource "azurerm_virtual_network" "vnet" {
  name                = "VNet-TF-Testing"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  }
  