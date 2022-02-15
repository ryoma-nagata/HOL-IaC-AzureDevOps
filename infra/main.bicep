targetScope = 'resourceGroup'

// general params
param storagePrefix string  
param location string = resourceGroup().location

module storage 'modules/services/storage.bicep' = {
  name: 'storageDeployment'
  params: {
    location: location
    storagePrefix: storagePrefix
  }
}


