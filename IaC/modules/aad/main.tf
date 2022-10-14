data "azuread_client_config" "current" {}

resource "azuread_group" "aadGroup" {
  display_name     = "aksAdmins"
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = true
}
