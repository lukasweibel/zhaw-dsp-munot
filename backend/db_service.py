from backend.data.in_memory_db import execute_sql


def db_request():
    # Let LLM Create Select Statement
    # Get Data via Select Statement froM DB
    # Return Data from DB
    return str(execute_sql("SELECT * FROM materialien;"))
