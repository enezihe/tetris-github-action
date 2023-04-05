provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "sshkey"
    storage_account_name = "ccseyhan"
    container_name       = "tetris-githubaction-backend"
    key                  = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "example" {
  name     = "test1"
  location = "East US"
}

resource "azurerm_container_registry" "acr" {
  name                = "ccseyhan"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "Standard"
  admin_enabled       = false
}

resource "azurerm_service_plan" "example" {
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "example" {
  name                = "ccseyhan-webapp"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {}
}

