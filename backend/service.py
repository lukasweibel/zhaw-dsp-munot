from backend.layers.db_layer import retrieve_data_from_db
from backend.layers.text_layer import result_set_to_natural_language
from backend.layers.typo_layer import clear_typos_in_user_question
from backend.layers.manager_layer import ask_for_needed_layers
from backend.layers.pdf_layer import get_pdf_answer
from backend.layers.merge_layer import merge_results_to_one_answer


def receive_layered_response(user_question):
    results = []

    layers = ask_for_needed_layers(user_question)

    for layer_obj in layers:
        layer_id = layer_obj.get('layer')
        layer_question = layer_obj.get('frage')

        print("Layer ID: " + str(layer_id))
        print("Question: " + layer_question)

        match layer_id:
            case 1:
                cleared_user_question = clear_typos_in_user_question(
                    layer_question)
                db_result_set = retrieve_data_from_db(cleared_user_question)
                natural_language_answer = result_set_to_natural_language(
                    layer_question, db_result_set)
                results.append(natural_language_answer)
            case 2:
                file_path = "backend/data/VGT_Weisungen_2018_d_01.pdf"
                answer = get_pdf_answer(file_path, layer_question)
                results.append(answer)
            case 3:
                file_path = "backend/data/Zeitplan_MC_2024.pdf"
                answer = get_pdf_answer(file_path, layer_question)
                results.append(answer)

    if len(results) == 1:
        return results[0]
    else:
        return merge_results_to_one_answer(user_question, results)
