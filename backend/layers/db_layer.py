from backend.common.file_helper import load_txt_file
from backend.common.llm_request import generate_text
from backend.data.db_wrapper import execute_sql, execute_sql_via_api
import re


def retrieve_data_from_db(user_input):
    # Let LLM Create Select Statement
    raw_sql = generate_sql(user_input)
    sql = clean_sql_content(raw_sql)
    if not is_sql_safe(sql):
        print("Generated SQL is not a SELECT")
        return "Fehler beim Erstellen der Datenabfrage"

    response = str(execute_sql_via_api(sql))
    print("DATA RESULT RESPONSE:\n" + response)
    return response


def generate_sql(user_input):
    base_prompt = load_txt_file('./backend/layers/prompts/db_layer_prompt.txt')
    prompt = f"{base_prompt}\n\nUser Request: \n{user_input}"
    sql = generate_text(prompt)
    print("DATA SQL RESPONSE:\n" + sql)
    return sql


def clean_sql_content(raw_sql: str) -> str:
    if raw_sql is None or raw_sql.strip() == "":
        print("Generated SQL is empty")
        return "Fehler beim Erstellen der Datenabfrage"

    cleaned_sql = raw_sql.replace("```sql", "").replace("```", "").strip()
    return cleaned_sql


def is_sql_safe(sql: str) -> bool:
    return bool(re.match(r"(?is)^SELECT.*", sql))
