# to use kubectl
az aks install-cli

$subscriptionId = "2893e19b-1b1b-45ce-a107-5d171398d1d3"
$resourceGroup = "Mile-rg-WUS2"
$aksClusterName = "Mile-AKS-WUS2"
$acrName = "mileacrglobal"
$AcrResourceGroup = "Mile-rg-Global"


# Login to Azure
try {
    $account = az account show --output json
    Write-Output "User is already logged in to Azure."
} catch {
    Write-Output "User is not logged in to Azure. Logging in..."
    az login
}

az acr login --name $acrName

# Select subscription
az account set -s $subscriptionId

# create namespace
kubectl apply -f ./charts/mile/namespace.yaml

# Integrate ACR with AKS
# az aks update --resource-group $resourceGroup --name $aksClusterName --attach-acr $acrName

# Get AKS credentials
az aks get-credentials --resource-group $resourceGroup --name $aksClusterName
kubectl config use-context $aksClusterName


# Install Helm chart
helm upgrade --install --wait --timeout 1800s --namespace mileproj --values charts/mile/values.yaml mile-release charts/mile

# Verify installation
helm status $helmChartName
kubectl get deployments
kubectl get pods