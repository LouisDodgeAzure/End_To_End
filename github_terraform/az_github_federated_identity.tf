provider "azurerm" {
  features {}
}

provider "azuread" {}

provider "github" {
  token = var.github_token
}

resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_user_assigned_identity" "example" {
  name                = var.user_assigned_identity_name
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
}

resource "azuread_application" "example" {
  display_name = var.application_registration_name
}

resource "azuread_service_principal" "example" {
  client_id = azuread_application.example.client_id
}

resource "azuread_application_federated_identity_credential" "example" {
  application_id = azuread_application.example.id
  display_name          = var.federated_credential_name
  audiences             = [var.federated_credential_audience]
  issuer                = var.federated_credential_issuer
  subject               = var.federated_credential_subject
}

resource "azurerm_role_assignment" "example" {
  scope                = azurerm_resource_group.example.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.example.object_id
}

# GitHub Secrets
resource "github_actions_secret" "azure_client_id" {
  repository      = var.github_repository
  secret_name     = "AZURE_CLIENT_ID"
  plaintext_value = azuread_application.example.client_id
}

resource "github_actions_secret" "azure_tenant_id" {
  repository      = var.github_repository
  secret_name     = "AZURE_TENANT_ID"
  plaintext_value = data.azuread_client_config.current.tenant_id
}

resource "github_actions_secret" "azure_subscription_id" {
  repository      = var.github_repository
  secret_name     = "AZURE_SUBSCRIPTION_ID"
  plaintext_value = var.azure_subscription_id
}

data "azuread_client_config" "current" {}
