# Deployment

## Deploy first runner images to Azure Container Registry

Using **sudo** mode:

```bash
az login --use-device-code --tenant <tenantId>
```

Get the access token for the container registry

```bash
TOKEN=$(az acr login --name <acrName> --expose-token --output tsv --query accessToken)
```

Login to the container registry

```bash
echo "$TOKEN" | docker login <acrName>.azurecr.io -u 00000000-0000-0000-0000-000000000000  --password-stdin
```

## Build the image

```bash
git clone https://github.com/damienaicheh/container-apps-ci-cd-runner-tutorial.git
cd container-apps-ci-cd-runner-tutorial

## For Azure DevOps
docker build -t <acrName>.azurecr.io/ado-agent:latest -f Dockerfile.azure-pipelines .

# or with GitHub Actions
docker build -t <acrName>.azurecr.io/gh-runner:latest -f Dockerfile.github .
```

## Push the image to the container registry

```bash
## For Azure DevOps
docker push <acrName>.azurecr.io/agent:latest

# or with GitHub Actions
docker push <acrName>.azurecr.io/gh-runner:latest
```

List the images in the container registry

```bash
az acr repository list --name <acrName> --output table
```

## Github PAT for Container App Job AuthZ
Follow the instructions [here][gh-sh-pat-create] and copy the resulting PAT for next step. 

## Use the Keda documentation:
https://keda.sh/docs/2.10/scalers/azure-pipelines/
https://keda.sh/docs/2.10/scalers/github-runner/

## App Registration
Set:
Contributor rights on subscription level

[gh-sh-pat-create]:https://learn.microsoft.com/en-us/azure/container-apps/tutorial-ci-cd-runners-jobs?tabs=bash&pivots=container-apps-jobs-self-hosted-ci-cd-github-actions#get-a-github-personal-access-token