// Bicep template to deploy an Azure Storage Account

// Parameters

@description('The location for the storage account')
param location string = resourceGroup().location

@allowed([
  'Standard_LRS'
  'Standard_GRS'
  'Standard_RAGRS'
  'Standard_ZRS'
  'Premium_LRS'
  'Premium_ZRS'
])
@description('The SKU of the storage account')
param skuName string = 'Standard_LRS'

@description('Timestamp for the deployment')
param deploymentTimestamp string = utcNow()

// Variables

var storageAccountName = toLower('sa${uniqueString(resourceGroup().id)}')
var tags = union(resourceGroup().tags, {
  CreatedBy: 'Bicep Template'
  CreatedOn: deploymentTimestamp
})

// Resources

resource symbolicname 'Microsoft.Storage/storageAccounts@2024-01-01' = {
  name: storageAccountName
  kind: 'StorageV2'
  location: location
  sku: {
    name: skuName
  }
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
    allowSharedKeyAccess: false
    minimumTlsVersion: 'TLS1_2'
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
  }
  tags: tags
}
