from backend.data import in_memory_db
import requests
import json

def execute_sql(sql_string):
    return in_memory_db.execute_sql(sql_string)

def execute_sql_via_api(sql):
    url = "https://rangliste.munotcup.ch/backend/raw/878c5b1e-fe76-400e-92f4-2d263c05ce40"
    headers = {
        "Content-Type": "application/json"
    }
    payload = {
        "query": sql
    }
    
    try:
        response = requests.post(url, headers=headers, json=payload)
        response.raise_for_status()
        return response.json
    except requests.exceptions.RequestException as e:
        print("API returned an error")
        return {"result": "Fehler bei der Datenbankabfrage"}