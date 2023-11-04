//Run for initial backend Terraform setup, with az deployment sub create --location <location> --template-file .\tfbackend.bicep

targetScope='subscription'

param resourceGroupName string = 'tf-backend-rg'
param resourceGroupLocation string = 'uksouth'
param storageName string = 'tfbackendwebappsa'

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
}

module storageAcct './modules/storage.bicep' = {
  name: 'storageModule'
  scope: rg
  params: {
    storageLocation: resourceGroupLocation
    storageName: storageName
  }
}
