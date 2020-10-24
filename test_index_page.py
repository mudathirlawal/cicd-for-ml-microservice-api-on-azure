from flask import Flask, request, jsonify, json, current_app
from app import app, predict
import pytest

@pytest.fixture
def client():
    with app.test_client() as client:
        with app.app_context():  
            assert current_app.config["ENV"] == "production"
        yield client

def test_index_page(client):
   response = client.get('/')
   assert response.status_code == 200
   assert b'Sklearn Prediction Home' in response.data