terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
    }
  }
}

provider "azuread" {
  tenant_id = "619ecf84-fc66-443a-9e28-b1f131a14244"
}
