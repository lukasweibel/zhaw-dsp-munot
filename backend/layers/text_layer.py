from backend.common.file_helper import load_txt_file
from backend.common.llm_request import generate_text


def result_set_to_natural_language(original_question, resultset):
    base_prompt = load_txt_file('./backend/layers/prompts/text_layer_prompt.txt')
    prompt = base_prompt.format(
        user_frage=original_question, resultset=resultset)
    answer = generate_text(prompt)
    print("Text response:\n" + answer)
    return answer
