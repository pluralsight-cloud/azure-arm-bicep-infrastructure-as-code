### Parameters ###
deploymentName="module03Demo"
rgName="ps-arm-module-03"
deploymentLocation="australiaeast"

### Create Resource Group ###
az group create \
  --name $rgName \
  --location $deploymentLocation \
  --tags "Owner=James Bannan" "Purpose=Module 03 Demo"

### Deploy Azure solution ###
az deployment group create \
  --name "$deploymentName-before" \
  --resource-group $rgName \
  --template-uri "https://raw.githubusercontent.com/Azure/azure-docs-json-samples/refs/heads/master/azure-resource-manager/what-if/what-if-before.json"

 ### Deploy updated Azure solution ###
az deployment group create \
  --name "$deploymentName-after" \
  --resource-group $rgName \
  --template-uri "https://raw.githubusercontent.com/Azure/azure-docs-json-samples/refs/heads/master/azure-resource-manager/what-if/what-if-after.json" 