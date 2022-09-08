param location string = 'westeurope'
param storageName string
param rgName string

targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
}

module myApp 'example-app.bicep' = {
  scope: rg
  name: '${deployment().name}-app'
  params: {
    location: location
    storageName: storageName
  }
}
