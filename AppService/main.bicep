targetScope = 'subscription'

@description('The location of the Azure resources')
param location string

@description('The name of the resource group')
param rgName string

param fqdnStorage string

var suffix = uniqueString(rg.id)

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01'  = {
  name: rgName
  location: location
}

module appServiceApp 'modules/appservice.bicep' = {
  name: 'appService'
  scope: resourceGroup(rgName)
  params: {
    location: location
    suffix: suffix
    fqdnStorage: fqdnStorage
 }
}

output appServiceAppName string = appServiceApp.outputs.appServiceAppName
