# CI/CD for Machine Learning Microservice API on Azure
[![Build Status](https://dev.azure.com/smartkidshub/ml-microservice-api/_apis/build/status/mudathirlawal.cicd-for-ml-microservice-api-on-azure?branchName=ops)](https://dev.azure.com/smartkidshub/ml-microservice-api/_build/latest?definitionId=1&branchName=ops)
![Python application test with Github Actions](https://github.com/mudathirlawal/cicd-for-ml-microservice-api-on-azure/workflows/Python%20application%20test%20with%20Github%20Actions/badge.svg)

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

4. [On GitHub,](https://www.github.com/login) fork the repository https://github.com/mudathirlawal/cicd-for-ml-microservice-api-on-azure.git
into your [GitHub account.](https://www.github.com/login)

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

   From the first line of output from the previous `az webapp up` command, copy the name 
   of your resource group, which is similar to 
   `{your-name}_rg_Linux_{your-region}`

Enter the following command, using your resource group name, your app service name, and your 
startup file or command:

#### Bash

```shell
az webapp config set -g <your-resource-group> -n <your-appservice> 
```
   
Again, when the command completes, it shows JSON output in the Cloud Shell.

To see the running app, open a browser and go to http:///<your-appservice/>/.azurewebsites.net. 
If you see a generic page, wait a few seconds for the App Service to start, and refresh the page.

### Bash: Run app in a virtual environment within Azure Cloud Shell

```shell
sudo apt-get install python3-venv  # If needed 
python3 -m venv .env
source .env/bin/activate
pip install -r requirements.txt
export set FLASK_APP=app.webapp
python3 -m flask run
```

### PowerShell: Run app in a virtual environment within Azure Cloud Shell

```PowerShell
py -3 -m venv .env
.env\scripts\activate
pip install -r requirements.txt
$env:FLASK_APP = "app.webapp"
python -m flask run
```

Open a browser and navigate to http://localhost:5000 to view the app. When you are 
finished, close the browser, and stop the Flask server with Ctrl+C.

## Enhancements
<TODO: A short description of how to improve the project in the future>
