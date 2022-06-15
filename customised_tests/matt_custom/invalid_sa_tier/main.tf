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

resource "azurerm_storage_account" "sa_1" {
  name                = "${var.project_tag}-sa1"
  resource_group_name = azurerm_resource_group.az_rg_1.name
  location            = azurerm_resource_group.az_rg_1.location

  account_tier             = "Standard" # A correct value
  #account_tier             = "FAILED"
  account_replication_type = "GRS"

  tags = {
    Project     = var.project_tag
    Owner       = var.owner_tag
    Environment = var.environment_tag
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_storage_account" "sa_2" {
  name                = "${var.project_tag}-sa2"
  resource_group_name = azurerm_resource_group.az_rg_1.name
  location            = azurerm_resource_group.az_rg_1.location

  account_tier             = "Standard" # Expecting Standard or Premium, not standard
  account_replication_type = "GRS"

  tags = {
    Project     = var.project_tag
    Owner       = var.owner_tag
    Environment = var.environment_tag
    ManagedBy   = "Terraform"
  }
}