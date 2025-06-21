### Parameters ###
deploymentName="module04Demo"
rgName="ps-arm-module-04"
deploymentLocation="australiaeast"
templateUrl="https://raw.githubusercontent.com/Azure/azure-quickstart-templates/refs/heads/master/quickstarts/microsoft.web/function-app-linux-consumption/azuredeploy.json"
parametersUrl="https://raw.githubusercontent.com/Azure/azure-quickstart-templates/refs/heads/master/quickstarts/microsoft.web/function-app-linux-consumption/azuredeploy.parameters.json"

### Create Resource Group ###
az group create \
  --name $rgName \
  --location $deploymentLocation \
  --tags "Owner=James Bannan" "Purpose=Module 04 Demo"

### Deploy Azure solution ###
az deployment group create \
  --name $deploymentName \
  --resource-group $rgName \
  --template-uri $templateUrl \
  --parameters $parametersUrl