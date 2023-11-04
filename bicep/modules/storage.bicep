param storageLocation string
param storageName string
param containerName string = 'tfstate'

resource storage 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageName
  location: storageLocation
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2022-09-01' = { 
  name: '${storage.name}/default/${containerName}' 
}
