# USEFUL COMMANDS
# ===============

# Azure CLI
az webapp up -n <your-appservice>
az webapp log tail
az group delete

# Logs: You can inspect the logs from your running application at:
https://<app-name>.scm.azurewebsites.net/api/logs/docker
# Or stream them:
az webapp log tail

# Mac/ Linux Shell
sudo apt-get install python3-venv  # If needed
python3 -m venv .cicd-for-ml-microservice-api-on-azure
source .cicd-for-ml-microservice-api-on-azure/bin/activate
pip install -r requirements.txt
export set FLASK_APP=app.webapp
python3 -m flask run

git clone https://github.com/<your-alias>/cicd-for-ml-microservice-api-on-azure
cd cicd-for-ml-microservice-api-on-azure
az webapp up -n <your-appservice>
az webapp config set -g <your-resource-group> \
    -n <your-appservice> \
    --startup-file <your-startup-file-or-command>

# To see the running app, open a browser and 
# go to http://<your-appservice>.azurewebsites.net

# Create an Azure DevOps project and connect to Azure
# In a browser, go to dev.azure.com.
# https://dev.azure.com/<your-organization-name>

az group delete

# Load Testing:
# First ensure your server is running:
$ ./example_server.sh
locust -f locustfile.py --host=http://localhost:8080
# With Locust running we can open the web user interface 
# at: http://localhost:8089.

# Linting


# Installations


# Python Virtual Environment 
python3 -m venv ~/.cicd-for-ml-microservice-api-on-azure
source ~/.cicd-for-ml-microservice-api-on-azure/bin/activate

# Git
git clone https://github.com/<your-alias>/cicd-for-ml-microservice-api-on-azure

# Make
make all
make lint
make test




















































































































































































































