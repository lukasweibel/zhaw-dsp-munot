import json
from backend.common.file_helper import load_txt_file
from backend.common.llm_request import generate_text


def validate_user_question(user_question):
    base_prompt = load_txt_file('./backend/layers/prompts/validator_question_layer_prompt.txt')
    prompt = f"{base_prompt}\n\nDein zu überprufender Text lautet: \n{user_question}"
    answer = generate_text(prompt)
    answer_json = json.loads(answer)
    print("Validator response:\n" + answer)
    return answer_json


def validate_sql(user_question):
    base_prompt = load_txt_file('./backend/layers/prompts/validator_sql_layer_prompt.txt')
    prompt = f"{base_prompt}\n\nDein zu überprufender Text lautet: \n{user_question}"
    answer = generate_text(prompt)
    answer_json = json.loads(answer)
    print("Validator response:\n" + answer)
    return answer_json