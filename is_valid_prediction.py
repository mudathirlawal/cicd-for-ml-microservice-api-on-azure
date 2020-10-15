
def is_valid_prediction(jsonified_prediction):
	json_data_in_dict_form = json.loads(jsonified_prediction)
	prediction_value_list = json_data_in_dict_form["prediction"]
	# if type(prediction_value_list) == list:
	for value in prediction_value_list:
		if type(value) == float:
			return True # Delibrately stop loop after first iteration
		else:
			return False