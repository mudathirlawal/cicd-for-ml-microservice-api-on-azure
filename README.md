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

<TODO: My instructions for running the Python project. How could a user with no context 
run this project without asking you for any help. Include screenshots with explicit steps 
to create that work. Will, at least, include the following screenshots:>

1- Project running on Azure App Service
2- Project cloned into Azure Cloud Shell
3- Passing tests that are displayed after running the make all command from the Makefile
4- Output of a test run
5- Successful deploy of the project in Azure Pipelines. Note the official documentation 
   should be referred to and double checked as you setup CI/CD.
6- Running Azure App Service from Azure Pipelines automatic deployment
7- Successful prediction from deployed flask app in Azure Cloud Shell. Use this file as 
   a template for the deployed prediction. The output should look similar to this:
      udacity@Azure:~$ ./make_predict_azure_app.sh
      Port: 443
      {"prediction":[20.35373177134412]}
8- Output of streamed log files from deployed application

## Enhancements
<TODO: A short description of how to improve the project in the future>
