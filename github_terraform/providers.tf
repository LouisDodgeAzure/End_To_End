terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.79.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.45.0"
    }

    github = {
      source  = "integrations/github"
      version = "~> 5.42"
    }
  }
  required_version = ">= 1.6.3"
}
