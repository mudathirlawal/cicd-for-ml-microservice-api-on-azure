
import sys
# insert at position 1 in the path, as 0 is the path of this file.
sys.path.insert(1, '/home/aminat/cicd-for-ml-microservice-api-on-azure')
from app import jsonified_prediction

# # Bring packages onto the path
# import sys, os
# sys.path.append(os.path.abspath(os.path.join('..', 'config')))

# # Carry out import
# from config.config import *

def get_validity(jsonified_prediction):
	json_data_in_dict_form = json.loads(jsonified_prediction)
	prediction_value_list = json_data_in_dict_form["prediction"]
	# if type(prediction_value_list) == list:
	for value in prediction_value_list:
		if type(value) == float:
			return True # Delibrately stop loop after first iteration
		else:
			return False