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
}

resource "azuread_service_principal" "gitHubSp" {
  application_id = azuread_application.githubApp.application_id
}

resource "azurerm_role_assignment" "githubAppRoleAssignment" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.gitHubSp.id
}
