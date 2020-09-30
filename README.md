# CI/CD for Machine Learning Microservice API on Azure
[![Build Status](https://dev.azure.com/smartkidshub/ml-microservice-api/_apis/build/status/mudathirlawal.cicd-for-ml-microservice-api-on-azure?branchName=ops)](https://dev.azure.com/smartkidshub/ml-microservice-api/_build/latest?definitionId=1&branchName=ops)
![Python application test with Github Actions](https://github.com/mudathirlawal/cicd-for-ml-microservice-api-on-azure/workflows/Python%20application%20test%20with%20Github%20Actions/badge.svg)

Overview:
This project implements continous integration and continous delivery pipeline 
for a Python machine learning API built with the Flask web framework. And the 
application is deployed into Azure.  

The pre-trained sklearn model used would predict housing prices in Boston according 
to several features, such as average rooms in a home and data about highway access, 
teacher-to-pupil ratios, and so on. If you're curious, you can read more about the 
data, which was initially taken from Kaggle, on the data source site. This project 
also demonstrates operationalization of the serverless machine learning app (app.py) 
that serves out predictions (inference) about housing prices through API calls. 
This project could be extended to any pre-trained machine learning model, such as 
those for image recognition and data labeling.
