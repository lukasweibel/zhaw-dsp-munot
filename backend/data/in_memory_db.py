import sqlite3

# Path to your SQLite database file (with .sqlite extension)


# Now you can use `memory_conn` to interact with the in-memory database
# For example, let's list all tables in the in-memory database:
# cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
# tables = cursor.fetchall()

# for table in tables:
#    print(table)
# print("Tables in in-memory database:", tables)


# print("Data in database:", data)
# Don't forget to close connections when done

def execute_sql(sql_string):
    # TODO Initialize DB in another way (We got some problems with inmemory in different threads
    db_file_path = './backend/data/data.sqlite'
    file_conn = sqlite3.connect(db_file_path)
    memory_conn = sqlite3.connect(':memory:')
    file_conn.backup(memory_conn)
    cursor = memory_conn.cursor()
    cursor.execute(sql_string)
    return cursor.fetchall()
