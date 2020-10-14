import sys
# insert at position 1 in the path, as 0 is the path of this file.
sys.path.insert(1, '/home/aminat/cicd-for-ml-microservice-api-on-azure')
from app import jsonified_prediction
from validate_prediction import get_validity

def test_is_valid_prediction(get_validity, jsonified_prediction):
    assert(get_validity(jsonified_prediction) == True)