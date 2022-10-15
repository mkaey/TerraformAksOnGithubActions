data "azuread_client_config" "current" {}
data "azurerm_subscription" "current" {}

resource "azuread_group" "aadGroup" {
  display_name     = "aksAdmins"
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = true
}

resource "azuread_application" "githubApp" {
  display_name     = "gitHubActions"
  identifier_uris  = ["api://githubactions"]
  owners           = [data.azuread_client_config.current.object_id]
  sign_in_audience = "AzureADMyOrg"

  required_resource_access {
    resource_app_id = "00000003-0000-0000-c000-000000000000"

    resource_access {
      id   = "62a82d76-70ea-41e2-9197-370581804d09" # Group.Write.All
      type = "Role"
    }
    resource_access {

      id   = "df021288-bdef-4463-88db-98f22de89214" # User.Read.All
      type = "Role"

    }
  }


}

resource "azuread_service_principal" "gitHubSp" {
  application_id = azuread_application.githubApp.application_id
}

resource "azurerm_role_assignment" "githubAppRoleAssignment" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.gitHubSp.id
}
