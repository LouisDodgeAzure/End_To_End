variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  default = "github_rg_ld"
  type = string
}

variable "resource_group_location" {
  description = "Location of the Azure Resource Group"
  default = "UK South"
  type = string
}

variable "user_assigned_identity_name" {
  description = "Name of the Azure User Assigned Identity"
  default = "ldGithubActionsIdentity"
  type = string
}

variable "application_registration_name" {
  description = "Display Name of the Azure AD Application Registration"
  default = "ldGithubActionsAppRegistration"
  type = string
}

variable "federated_credential_name" {
  description = "Name of the Federated Credential"
  default = "ldGithubActionsFederatedCred"
  type = string

}

variable "federated_credential_audience" {
  description = "Audience for the Federated Credential"
  default = "api://AzureADTokenExchange"
  type = string
}

variable "federated_credential_issuer" {
  description = "Issuer URL for the Federated Credential"
  default = "https://token.actions.githubusercontent.com"
  type = string
}

variable "federated_credential_subject" {
  description = "Subject for the Federated Credential"
  default = "repo:LouisDodgeAzure/End_To_End:ref:refs/heads/master"
  type = string
}

#Do not add a default github token- tokens are sensitive!
variable "github_token" {
  description = "The GitHub token used for authentication"
  type        = string
}

variable "github_repository" {
  description = "The GitHub repository where secrets will be stored"
  default = "End_To_End"
  type        = string
}

#Do not add default subscription, as this is sensitive.
variable "azure_subscription_id" {
  description = "The Azure Subscription ID"
  type        = string
}
