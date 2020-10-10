# ***************
# USEFUL COMMANDS
# ***************

# ---------------
# Project Workflow on a Mac/Linux Machine or Azure Cloud Shell
cd ~
sudo apt-get install python3-venv  # If needed
git clone https://github.com/<your-alias>/cicd-for-ml-microservice-api-on-azure
cd cicd-for-ml-microservice-api-on-azure
python3 -m venv .cicd-for-ml-microservice-api-on-azure
source .cicd-for-ml-microservice-api-on-azure/bin/activate
make all
az webapp up -n <your-desired-name-for-the-appservice>
az webapp config set -g <your-resource-group> \
    -n <your-appservice-name>
export set FLASK_APP=app.webapp
python3 -m flask run
./predict_housing_price.sh
# To see the running app, open a browser and 
# go to http://<your-appservice-name>.azurewebsites.net

# Load Testing:
# First ensure the microservice is running:
./predict_housing_price.sh
locust -f locustfile.py --host=http://localhost:8080
# With Locust running we can open the web user interface 
# at: http://localhost:8089.

# Logs: You can inspect the logs from your running application at:
https://<app-name>.scm.azurewebsites.net/api/logs/docker
# Or stream them:
az webapp log tail

# Create an Azure DevOps project and connect to Azure
# In a browser, go to dev.azure.com.
# https://dev.azure.com/<your-organization-name>

# Clean up resources:
az group delete
# -------------

# Azure CLI
az webapp up -n <your-appservice>
az webapp log tail
az group delete

# Linting
pylint --disable=R,C,W1203,W0702 app.py

# Installations
pip install --upgrade pip &&\
    pip install -r requirements.txt
sudo apt-get install python3-venv  # If needed

# Python Virtual Environment 
python3 -m venv ~/.cicd-for-ml-microservice-api-on-azure
source ~/.cicd-for-ml-microservice-api-on-azure/bin/activate

# Git
git clone https://github.com/<your-alias>/cicd-for-ml-microservice-api-on-azure
git branch
git checkout <branch name>
git add <filename>
git commit -m "Commit message here"
git push origin <branch name>

# Make
make all
make lint
make test
make setup
