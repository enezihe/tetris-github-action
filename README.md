# Tetris Game Deployment Pipeline
This project contains the necessary code to deploy a Tetris game application using Terraform and GitHub Actions. The infrastructure is deployed to Azure using the azurerm provider and consists of an Azure Container Registry, an Azure Web App, and an Azure Resource Group. The Docker image of the game is built and pushed to the Azure Container Registry, and then deployed to the Azure Web App.

## Pipeline Overview
The pipeline consists of three stages: Terraform plan, Terraform apply, and Build/Push Docker Image. Here is an overview of each stage:

1. Terraform Plan - The first stage of the pipeline uses the terraform plan command to create an execution plan. This plan shows what changes Terraform will make to the infrastructure when it is applied. The plan is then saved to a file named tfplan. If the plan is successful, the pipeline continues to the next stage.

1. Terraform Apply - The second stage of the pipeline uses the terraform apply command to apply the changes shown in the execution plan created in the previous stage. If the apply is successful, the pipeline continues to the next stage.

1. Build/Push Docker Image - The final stage of the pipeline builds and pushes the Docker image of the Tetris game to the Azure Container Registry, and then deploys the image to the Azure Web App.

## Pipeline Configuration
The pipeline is configured using GitHub Actions. The configuration file main.yml is located in the .github/workflows directory. The pipeline is triggered by pushes to the main branch and pull requests against the main branch.

- Secrets
The pipeline uses the following secrets:

    - AZURE_CLIENT_ID - The Azure client ID used to authenticate with Azure.
    - AZURE_CLIENT_SECRET - The Azure client secret used to authenticate with Azure.
    - AZURE_SUBSCRIPTION_ID - The Azure subscription ID used to authenticate with Azure.
    - AZURE_TENANT_ID - The Azure tenant ID used to authenticate with Azure.
    - ACR_PASSWORD - The password used to authenticate with the Azure Container Registry.

- Variables
The pipeline uses the following variables:

    - app_service_plan_name - The name of the Azure App Service Plan.
    - app_service_sku - The SKU of the Azure App Service.
    - acr_name - The name of the Azure Container Registry.
    - acr_sku - The SKU of the Azure Container Registry.
    - location - The location where the infrastructure will be deployed.
    - rg_name - The name of the Azure Resource Group.
    - web_app_name - The name of the Azure Web App.
    - github_repo_name - The name of the GitHub repository.
## Terraform Configuration
The Terraform configuration file main.tf is located in the infrastructure directory. The configuration file uses the azurerm and github providers to create the necessary infrastructure. The following resources are created:

- An Azure Resource Group.
- An Azure Container Registry.
- An Azure App Service Plan.
- An Azure Web App.

The Azure Container Registry is used to store the Docker image of the Tetris game, which is built and pushed to the registry during the pipeline. The Azure Web App is used to host the game.

The Terraform configuration also creates the following GitHub Actions secrets and variables:

- ACR_PASSWORD - The password used to authenticate with the Azure Container Registry.
- WEBAPP - The name of the Azure Web App.
- RESOURCEGROUP - The name of the Azure Resource Group.