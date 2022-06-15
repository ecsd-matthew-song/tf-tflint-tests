terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.97.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Resource group section
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
