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

# Network section
resource "azurerm_virtual_network" "az_vn" {
  name                = "${var.project_tag}-vn"
  address_space       = var.address_space
  location            = azurerm_resource_group.az_rg_1.location
  resource_group_name = azurerm_resource_group.az_rg_1.name

  tags = {
    Project     = var.project_tag
    Owner       = var.owner_tag
    Environment = var.environment_tag
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_subnet" "az_subnet_1" {
  name                 = "${var.project_tag}-subnet-1"
  resource_group_name  = azurerm_resource_group.az_rg_1.name
  virtual_network_name = azurerm_virtual_network.az_vn.name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_network_interface" "az_ni" {
  name                = "${var.project_tag}-ni"
  location            = azurerm_resource_group.az_rg_1.location
  resource_group_name = azurerm_resource_group.az_rg_1.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.az_subnet_1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.single_vm_pub_ip.id
  }

  tags = {
    Project     = var.project_tag
    Owner       = var.owner_tag
    Environment = var.environment_tag
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_public_ip" "single_vm_pub_ip" {
  name                = "${var.project_tag}-pub-ip"
  resource_group_name = azurerm_resource_group.az_rg_1.name
  location            = azurerm_resource_group.az_rg_1.location
  allocation_method   = "Static"
  sku = "..."

  tags = {
    Project     = var.project_tag
    Owner       = var.owner_tag
    Environment = var.environment_tag
    ManagedBy   = "Terraform"
  }
}

# Virtual Machine section
resource "azurerm_linux_virtual_machine" "single_vm" {
  name                = "${var.project_tag}-single-vm"
  resource_group_name = azurerm_resource_group.az_rg_1.name
  location            = azurerm_resource_group.az_rg_1.location
  size                = var.single_vm_size
  admin_username      = var.admin_username
  network_interface_ids = [
    azurerm_network_interface.az_ni.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  tags = {
    Project     = var.project_tag
    Owner       = var.owner_tag
    Environment = var.environment_tag
    ManagedBy   = "Terraform"
  }
}

