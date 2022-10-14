terraform {
  required_providers {
    azuread = {
      source = "hashicorp/azuread"
    }
  }
}

provider "azuread" {
  tenant_id = "2f4a9838-26b7-47ee-be60-ccc1fdec5953"
}
