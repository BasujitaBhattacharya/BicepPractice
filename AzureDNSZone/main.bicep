targetScope = 'subscription'

@description('The location of the Azure resources')
param location string = 'canadacentral'

@description('The name of the resource group')
param rgName string

@description('The name of the DNS Zone')
param zoneName string


resource rg 'Microsoft.Resources/resourceGroups@2021-04-01'  = {
  name: rgName
  location: location
}

module azurednszone 'modules/azurednszone.bicep'  = {
  name: 'azurednszone'
  scope: resourceGroup(rgName)
  params: {
    zoneName : zoneName
 }
  
}

