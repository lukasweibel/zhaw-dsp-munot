from backend.layers.db_layer import retrieve_data_from_db
from backend.layers.text_layer import result_set_to_natural_language
from backend.layers.typo_layer import clear_typos_in_user_question


def receive_layered_response(user_question):
    cleared_user_question = clear_typos_in_user_question(user_question)
    db_result_set = retrieve_data_from_db(cleared_user_question)
    natural_language_answer = result_set_to_natural_language(
        user_question, db_result_set)
    return natural_language_answer
