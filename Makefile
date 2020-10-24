setup:
	python3 -m venv ~/.cicd-for-ml-microservice-api-on-azure

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv test_index_page.py

lint:
	pylint --disable=R,C,W1203,W0702 app.py

all: install lint test
