from backend.common.file_helper import load_txt_file
from backend.common.llm_request import generate_text
from backend.data.db_wrapper import execute_sql


def retrieve_data_from_db(user_input):
    # Let LLM Create Select Statement
    sql = generate_sql(user_input)
    response = str(execute_sql(sql))
    print("Data Result response:\n" + response)
    return response


def generate_sql(user_input):
    base_prompt = load_txt_file('./backend/layers/prompts/db_layer_prompt.txt')
    prompt = f"{base_prompt}\n\nUser Request: \n{user_input}"
    sql = generate_text(prompt)
    print("Data SQL response:\n" + sql)
    return sql
