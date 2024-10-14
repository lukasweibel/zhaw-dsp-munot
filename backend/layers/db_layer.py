from backend.common.file_helper import load_txt_file
from backend.common.llm_request import generate_text
from backend.data.in_memory_db import execute_sql


def retrieve_data_from_db(user_input):
    # Let LLM Create Select Statement
    base_prompt = load_txt_file('./backend/prompt/prompt.txt')
    print(base_prompt)
    prompt = f"{base_prompt}\n\nUser Request: \n{user_input}"
    print(prompt)
    sql = generate_text(prompt)
    print(sql)

    response = str(execute_sql(sql))
    print(response)
    return response
