# CI/CD for Machine Learning Microservice API on Azure
[![Build Status](https://dev.azure.com/smartkidshub/ml-microservice-api/_apis/build/status/mudathirlawal.cicd-for-ml-microservice-api-on-azure?branchName=ops)](https://dev.azure.com/smartkidshub/ml-microservice-api/_build/latest?definitionId=1&branchName=ops)
![Python application test with Github Actions](https://github.com/mudathirlawal/cicd-for-ml-microservice-api-on-azure/workflows/Python+application+test+with+Github+Actions/badge.svg)

## Overview

This project implements continous integration and continous delivery pipeline 
for a Python machine learning API built with the Flask web framework. The 
application is deployed into Azure.

The pre-trained sklearn model used predicts housing prices in Boston according to 
several features, such as average rooms in a home, data about highway access, 
teacher-to-pupil ratio, and so on. If you're curious, you can read more about the 
data, which was initially taken from Kaggle, [on the data source site.](https://www.kaggle.com/c/boston-housing) 
This project also demonstrates operationalization of the serverless machine learning 
app (app.py) that serves out predictions (inference) about housing prices through API 
calls. This project can be extended to any pre-trained machine learning model, such as 
those used for image recognition and data labeling.

## Project Plan

- [Link to Trello board for this project.](https://trello.com/b/IeN7udTH/ci-cd-for-ml-microservice-api-on-azure)
- [Link to spreadsheet that includes the project plan for this project.](https://docs.google.com/spreadsheets/d/1BEQnOTNx_PSh0zwm3Q15BGol5n4bmwO2J6IBVqrMSo0/edit?usp=sharing)

![alt text](/readme-images/building-a-ci-cd-pipeline.png)

## Demo

<TODO: Will add link to Screencast on YouTube>

## Instructions

### Create a repository for the app code

The quickest way to create an App Service instance is to use the Azure command-line 
interface (CLI) through the interactive Azure Cloud Shell. In the following steps, 
you use `az webapp up` to both provision the App Service and perform your first 
deployment of the microservice API.

1. Sign in to the Azure portal at https://portal.azure.com.
2. Open the Azure CLI by selecting the Cloud Shell button on the portal's toolbar:

   ![alt text](/readme-images/azure-cloud-shell-button.png)

3. The Cloud Shell appears along the bottom of the browser. Select Bash from the dropdown:

   ![alt text](/readme-images/azure-cloud-shell-interface.png)

4. [On GitHub,](https://github.com) fork the repository https://github.com/mudathirlawal/cicd-for-ml-microservice-api-on-azure.git 
   into your [GitHub account.](https://github.com)

5. In the Cloud Shell, clone the repository using `git clone`. As in:

   ```bash
   git clone https://github.com/<your-alias>/cicd-for-ml-microservice-api-on-azure
   ```
   Replace <your-alias> with the name of the GitHub account you used to fork the repository.
   
   #### Tip

   > To paste into the Cloud Shell, use `Ctrl+Shift+V`, or right-click and select Paste from 
   > the context menu.

   #### Note

   > The Cloud Shell is backed by an Azure Storage account in a resource group called 
   > cloud-shell-storage-[your-region]. That storage account contains an image of the 
   > Cloud Shell's file system, which stores the cloned repository. There is a small 
   > cost for this storage. You can delete the storage account at the end of this 
   > article, along with other resources you create.
   
### Provision the target Azure App Service

1. In the Cloud Shell, change directories into the repository folder that has the Flask 
   app, so the `az webapp up` command will recognize the app as Python. Then execute: 
   
   ```shell
   cd cicd-for-ml-microservice-api-on-azure
   ```
   
2. In the Cloud Shell, run `az webapp up` to create an App Service and initially deploy the API.  
   
   #### Bash:

   ```shell
   az webapp up -n [your-appservice]
   ```

   > Change [your-appservice] to a name for your app service that's unique across Azure. 
   > Typically, you use a personal or company name along with an app identifier, such as 
   > [your-name]-flaskpipelines. The app URL becomes [your-appservice].azurewebsites.net.

     When the command completes, it shows JSON output in the Cloud Shell.

   #### Tip

   > If you encounter a "Permission denied" error with a .zip file, you may have tried
   > to run the command from a folder that doesn't contain a Python app. The az webapp 
   > up command then tries to create a Windows app service plan, and fails.

   From the first line of output from the previous `az webapp up` command, 
   copy the name of your resource group, which is similar to:
   ```
   {your-name}_rg_Linux_{your-region}
   ```

   Enter the following command, using your resource group name, your app service name, and your 
   startup file or command:

   #### Bash

   ```shell
   az webapp config set -g <your-resource-group> -n <your-appservice> 
   ```

   Again, when the command completes, it shows JSON output in the Cloud Shell.

   To see the running app, open a browser and go to `http://[your-appservice].azurewebsites.net`. 
   If you see a generic page, wait a few seconds for the App Service to start, and refresh the 
   page.

### Bash: Run app in a virtual environment within Azure Cloud Shell

```shell
sudo apt-get install python3-venv  # If needed 
python3 -m venv ~/.cicd-for-ml-microservice-api-on-azure
source ~/.cicd-for-ml-microservice-api-on-azure/bin/activate
make all
export set FLASK_APP=app.py
python3 -m flask run
```

### PowerShell: Run app in a virtual environment within Azure Cloud Shell

```PowerShell
py -3 -m venv .cicd-for-ml-microservice-api-on-azure
.cicd-for-ml-microservice-api-on-azure\scripts\activate
pip install -r requirements.txt
$env:FLASK_APP = "app.py"
python -m flask run
```

Open a browser and navigate to http://localhost:5000 to view the app. When you are 
finished, close the browser, and stop the Flask server with Ctrl+C.

## Create an Azure DevOps project and connect to Azure

To deploy to Azure App Service from Azure Pipelines, you need to establish a service 
connection between the two services.

In a browser, go to `dev.azure.com`. If you don't yet have an account on Azure DevOps, 
select __Start free and get a free account.__ If you have an account already, select 
__Sign in to Azure DevOps.__

#### Important

> To simplify the service connection, use the same email address for Azure DevOps as you 
> use for Azure.

Once you sign in, the browser displays your Azure DevOps dashboard, at the URL 
`https://dev.azure.com/<your-organization-name>`. An Azure DevOps account can belong to 
one or more organizations, which are listed on the left side of the Azure DevOps dashboard. 
If more than one organization is listed, select the one you want to use for this walkthrough. 
By default, Azure DevOps creates a new organization using the email alias you used to sign in.

A project is a grouping for boards, repositories, pipelines, and other aspects of Azure DevOps. 
If your organization doesn't have any projects, enter the project name __Flask Pipelines__ under 
Create a project to get started, and then select __Create project.__

If your organization already has projects, select __New project__ on the organization page. In the 
Create new project dialog box, enter the project name __Flask Pipelines__, and select Create.

From the new project page, select __Project settings__ from the left navigation.

On the Project Settings page, select __Pipelines__ > __Service connections__, then select __New service__ 
connection, and then select __Azure Resource Manager__ from the dropdown.

In the Add an Azure Resource Manager service connection dialog box:

Give the connection a name. Make note of the name to use later in the pipeline.
For Scope level, select __Subscription__.
Select the subscription for your App Service from the Subscription drop-down list.
Under Resource Group, select your resource group from the dropdown.
Make sure the option Allow all pipelines to use this connection is selected, and then select __OK__.

The new connection appears in the Service connections list, and is ready for Azure Pipelines to 
use from the project.

#### Note

> If you need to use an Azure subscription from a different email account, follow the instructions 
> on [Create an Azure Resource Manager service connection with an existing service principal.](https://https://docs.microsoft.com/en-gb/azure/devops/pipelines/library/connect-to-azure?view=azure-devops#create-an-azure-resource-manager-service-connection-with-an-existing-service-principal)

## Create a Python-specific pipeline to deploy to App Service

1. From your project page left navigation, select __Pipelines__.
2. Select __New pipeline__.
3. On the Where is your code screen, select __GitHub__. You may be prompted to sign into GitHub.
4. On the Select a repository screen, select the repository that contains your app, such as 
   your fork of the Flask app.
5. You may be prompted to enter your GitHub password again as a confirmation, and then GitHub 
   prompts you to install the Azure Pipelines extension. On this screen, scroll down to the 
   __*Repository access section*__, choose whether to install the extension on all repositories or 
   only selected ones, and then select __Approve and install__.
6. On the Configure your pipeline screen, select __Python to Linux Web App on Azure__. Your new pipeline 
   appears. When prompted, select the __Azure subscription in which you created your Web App__.

   - Select the Web App
   - Select Validate and configure

   Azure Pipelines creates an `azure-pipelines.yml` file that defines your CI/CD pipeline as a series 
   of stages, Jobs, and steps, where each step contains the details for different tasks and scripts. 
   Take a look at the pipeline to see what it does. Make sure all the default inputs are appropriate 
   for your code.

## Run the pipeline

1. Select __Save__ at upper right in the editor, and in the pop-up window, add a commit message and select __Save__.

2. Select __Run__ on the pipeline editor, and select __Run again__ in the Run pipeline dialog box. Azure Pipelines 
   queues another pipeline run, acquires an available build agent, and has that build agent run the pipeline.
   The pipeline takes a few minutes to complete, especially the deployment steps. You should see green 
   checkmarks next to each of the steps.

   If there's an error, you can quickly return to the `YAML` editor by selecting the vertical dots at upper right 
   and selecting __Edit pipeline__.

3. From the build page, select the *Azure Web App task* to display its output. To visit the deployed site, 
   hold down the `Ctrl` key and select *the URL after App Service Application URL*.

#### Important

> If your app fails because of a missing dependency, then your requirements.txt file was not processed during 
> deployment. This behavior happens if you created the web app directly on the portal rather than using the 
> `az webapp up` command as directed in this guide.

> The `az webapp up` command specifically sets the build action __SCM_DO_BUILD_DURING_DEPLOYMENT__ to true. If you 
> provisioned the app service through the portal, however, this action is not automatically set.

> The following steps set the action:

> Open the Azure portal, *select your App Service*, then select __Configuration__.
> Under the Application Settings tab, select __New Application Setting__.
> In the popup that appears, set Name to __SCM_DO_BUILD_DURING_DEPLOYMENT__, set Value to true, and select __OK__.
> Select __Save__ at the top of the Configuration page.
> Run the pipeline again. Your dependencies should be installed during deployment.

## Clean up resources

To avoid incurring ongoing charges for any Azure resources you created in this walkthrough, such as a B1 App 
Service Plan, delete the resource group that contains the App Service and the App Service Plan. To delete the 
resource group from the Azure portal, select __Resource groups__ in the left navigation. In the resource group 
list, select the `...` to the right of the resource group you want to delete, select __Delete resource group__, 
and follow the prompts.

You can also use `az group delete` in the Cloud Shell to delete resource groups.

To delete the storage account that maintains the file system for Cloud Shell, which incurs a small monthly 
charge, delete the resource group that begins with __cloud-shell-storage-__.

## Enhancements

The Machine Learning model used in building this API is pre-trained. Therefore, to further generalize 
the implementation of this Continous Integration & Continous Deployment process, we could integrate 
the dataset training stage in the pipeline by employing the Azure Kubernetes Service (AKS) while 
leveraging relevant tools such as TensorFlow and KubeFlow to simplify the operation. In this architecture, 
the models will run in AKS clusters backed by GPU-enabled virtual machines.

For further information on this, see [Machine Learning model training with AKS,](https://docs.microsoft.com/en-us/azure/architecture/solution-ideas/articles/machine-learning-with-aks) by Microsoft.

## References

- Microsoft 2020, accessed 2020-10-07,\
  <https://azure.microsoft.com/en-us/services/kubernetes-service/#solution-architectures>
- Microsoft 2020, accessed 2020-10-07,\
  <https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops>  