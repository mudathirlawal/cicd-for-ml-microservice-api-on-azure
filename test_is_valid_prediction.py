def test_is_valid_prediction(get_validity, jsonified_prediction):
    assert(get_validity(jsonified_prediction) == True)