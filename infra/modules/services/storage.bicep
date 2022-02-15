param location string = resourceGroup().location

@minLength(3)
@maxLength(11)
param storagePrefix string
@allowed([
  'Standard_LRS' 
  'Standard_GRS'
  'Standard_RAGRS'
])
param storageSKU string = 'Standard_LRS'

var uniqueStorageName  = '${storagePrefix}${uniqueString(resourceGroup().id)}'

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-08-01'={
  name: uniqueStorageName
  location: location
  sku: {
    name: storageSKU
  }
  kind: 'StorageV2'
  properties:{
    accessTier:'Hot'
    networkAcls:{
      defaultAction: 'Deny'
    }
  }
}

output storageDfsEndpoint string ='https://${storageAccount.name}.dfs.${environment().suffixes.storage}'
