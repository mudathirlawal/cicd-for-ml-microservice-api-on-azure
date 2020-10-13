import time
from locust import HttpUser, TaskSet, task, between

class CallerActions(TaskSet):
    wait_time = between(1, 2)

    @task
    def index(self):
        self.client.get("/")

    @task(3)
    def get_prediction(self):
        self.client.get("/predictions")  

class APIUser(HttpUser):
    task = CallerActions
    min_wait = 5000
    max_wait = 9000
    host = "https://boston-api.azurewebsites.net:8089/"