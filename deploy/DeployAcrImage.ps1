
# install az cli cmdhttps://docs.oracle.com/en/java/javase/11/docs/api/
echo "Install az cli"
brew install azure-cli

# install docker
echo "Install docker"
brew install docker

az login
az account set -s 
$subscriptionId = "2893e19b-1b1b-45ce-a107-5d171398d1d3"
$resourceGroup = "Mile-rg-Global"
$containerRegistry = "mileacrglobal"

echo "login az acr"
$tokenCredential = $(az acr login --name $containerRegistry -t | ConvertFrom-Json)

# Login to ACR using access token
docker login $tokenCredential.loginServer --username 00000000-0000-0000-0000-000000000000 --password $tokenCredential.accessToken

$acrTag = $containerRegistry + ".azurecr.io/mile:latest"

# Tag your local Docker image
docker build ../src -t $acrTag --platform linux/amd64

# Push image to ACR
echo "Push Mile image to ACR"
docker push $acrTag

# list images in ACR
echo "List images in ACR"
az acr repository list --name $containerRegistry --output table