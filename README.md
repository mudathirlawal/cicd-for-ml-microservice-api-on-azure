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

```
git clone https://github.com/mudathirlawal/cicd-for-ml-microservice-api-on-azure.git
cd cicd-for-ml-microservice-api-on-azure
```

### Mac/Linux: Run app in a virtual environment
```shell
sudo apt-get install python3-venv  # If needed 
python3 -m venv .env
source .env/bin/activate
pip install -r requirements.txt
export set FLASK_APP=app.webapp
python3 -m flask run
```

### Windows: Run app in a virtual environment
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
