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

### Compare Azure solution ###
az deployment group what-if \
  --name $deploymentName \
  --resource-group $rgName \
  --template-uri $templateUrl \
  --parameters $parametersUrl

### Export Azure solution - Before ###
az group export \
  --name $rgName \
  --include-comments \
  --include-parameter-default-value \
  --output json > $rgName-before.json

### Export Azure solution - After ###
az group export \
  --name $rgName \
  --include-comments \
  --include-parameter-default-value \
  --output json > $rgName-after.json

### Compare templates ###
arm-compare \
  --left $rgName-before.json \
  --right $rgName-after.json \
  --format markdown \
  --output $rgName-diff.md