resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: 'mystorageaccount'
  location: resourceGroup().location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    // Issue: Allowing HTTP traffic
    enableHttpsTrafficOnly: false

    // Issue: Default network access is allowed
    networkAcls: {
      defaultAction: 'Allow'
      bypass: 'AzureServices'
      ipRules: []
      virtualNetworkRules: []
    }

    // Issue: No encryption specified
    encryption: {
      services: {
        blob: {
          enabled: false
        }
        file: {
          enabled: false
        }
      }
      keySource: 'Microsoft.Storage'
    }
  }
}
