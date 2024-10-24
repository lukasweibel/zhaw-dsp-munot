from backend.common.file_helper import load_txt_file
from backend.common.llm_request import generate_text


def merge_results_to_one_answer(user_question, results):
    base_prompt = load_txt_file('./backend/layers/merge_layer_prompt.txt')
    prompt = base_prompt.format(
        user_frage=user_question, results=results)
    answer = generate_text(prompt)
    return answer
