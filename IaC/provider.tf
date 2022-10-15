terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraformstate"
    storage_account_name = "stterraformstatemkaey"
    container_name       = "terraformstate"
    key                  = "terraformstate.tfstate"
  }

  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
    azuread = {
      source = "hashicorp/azuread"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azuread" {
  tenant_id = "619ecf84-fc66-443a-9e28-b1f131a14244"
}
