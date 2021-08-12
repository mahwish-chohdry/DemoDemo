terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.69.0"
    }
  }
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
  backend "azurerm"{
  resource_group_name  = "tfstate-rg"
  storage_account_name = "fmahwisht"
  container name   = "tfstate"
  key  =  "dev.terraform.tfstate"
  }