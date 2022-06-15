terraform {
  # Missing terraform version 
  # required_version = ">= 1.0.0" 
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      # Missing provider version
      # version = ">=2.97.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "az_rg_1" {
  name     = "${var.project_tag}-rg1"
  location = var.az_region

  tags = {
    Project     = var.project_tag
    Owner       = var.owner_tag
    Environment = var.environment_tag
    ManagedBy   = "Terraform"
  }
}

module "network-security-group" {
  source  = "Azure/network-security-group/azurerm"
  # Missing module source version
  #version = "3.6.0"

  resource_group_name = azurerm_resource_group.az_rg_1.name
  source_address_prefix = ["10.0.3.0/24"]
  destination_address_prefixes = []

  # insert the 3 required variables here
}
