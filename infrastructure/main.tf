provider "azurerm" {
  features {}
}

provider "github" {
}


terraform {
  backend "azurerm" {
    resource_group_name  = "sshkey"
    storage_account_name = "ccseyhan"
    container_name       = "tetris-githubaction-backend"
    key                  = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "rg1" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.rg1.name
  location            = var.location
  sku                 = var.acr_sku
  admin_enabled       = true
}

resource "azurerm_service_plan" "asp" {
  name                = var.app_service_plan_name
  resource_group_name = azurerm_resource_group.rg1.name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.app_service_sku
}

resource "azurerm_linux_web_app" "app1" {
  name                = var.web_app_name
  resource_group_name = azurerm_resource_group.rg1.name
  location            = var.location
  service_plan_id     = azurerm_service_plan.asp.id

  site_config {}
}

resource "github_actions_secret" "example_secret" {
  repository      = var.github_repo_name
  secret_name     = "ACR_PASSWORD"
  plaintext_value = azurerm_container_registry.acr.admin_password
  depends_on = [
    azurerm_container_registry.acr
  ]
}
