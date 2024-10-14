from backend.common.file_helper import load_txt_file
from backend.common.llm_request import generate_text
from backend.data.db_wrapper import execute_sql


def clear_typos_in_user_question(user_question):
    base_prompt = load_txt_file('./backend/layers/typo_layer_prompt.txt')
    vereine = execute_sql('select id,vereinsname from verein')
    prompt = base_prompt.replace('{vereine}', str(vereine))
    disziplinen = execute_sql('select id,name from disziplinen')
    prompt = prompt.replace('{disziplinen}', str(disziplinen))
    prompt = prompt.replace('{user_frage}', user_question)
    print(prompt)
    # ChatGPt ersetze mir die Mannschaften und Disziplinen mit ihren IDS {a,b}
    cleared_user_question = generate_text(prompt)
    print(cleared_user_question)
    return cleared_user_question
