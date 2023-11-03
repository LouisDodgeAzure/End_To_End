variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "ldendtoend"
}

variable "location" {
  description = "Azure region for the resources"
  default     = "UK South"
}

variable "acr_name" {
  description = "Name of the Azure Container Registry"
  default     = "ldacrendtoend"
}

variable "image_name" {
    description = "Name and version of the webapp image e.g. myimage:latest"
    default = "myimage:latest"
}

variable "webapp_name" {
  description = "Name for the Azure Web App"
  default     = "LdFlaskWebApp"
}
