from backend.common.file_helper import load_txt_file
from backend.common.llm_request import generate_text
from backend.data.db_wrapper import execute_sql


def retrieve_data_from_db(user_input):
    # Let LLM Create Select Statement
    base_prompt = load_txt_file('./backend/layers/db_layer_prompt.txt')
    prompt = f"{base_prompt}\n\nUser Request: \n{user_input}"
    sql = generate_text(prompt)

    response = str(execute_sql(sql))
    print(response)
    return response
