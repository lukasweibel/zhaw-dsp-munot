from backend.data import in_memory_db

def execute_sql(sql_string):
    return in_memory_db.execute_sql(sql_string)