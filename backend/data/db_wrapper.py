from backend.data import in_memory_db
import requests
import json
import os

from dotenv import load_dotenv


def execute_sql(sql_string):
    return in_memory_db.execute_sql(sql_string)


def execute_sql_via_api(sql):
    sql = sql.replace(';', '')
    url = os.getenv("TARGET_URL")
    headers = {
        "Content-Type": "application/json"
    }
    payload = {
        "query": sql
    }

    try:
        response = requests.post(url, headers=headers, json=payload)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.RequestException as e:
        print("API returned an error")
        return {"result": "Fehler bei der Datenbankabfrage"}
