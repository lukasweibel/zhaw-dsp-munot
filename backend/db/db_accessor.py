from datetime import datetime
import os
from dotenv import load_dotenv
from pymongo import MongoClient
from bson import ObjectId

load_dotenv()

mongodb_connection_string = os.getenv("MONGODB_CONNECTION_STRING")

client = MongoClient(mongodb_connection_string)

db = client['DSP']

tests_collection = db['tests']


def get_tests_by_type():
    documents = list(tests_collection.find())
    for document in documents:
        document['_id'] = str(document['_id'])
    return documents


def get_test_by_id(id):
    try:
        document = tests_collection.find_one({"_id": ObjectId(id)})
        if document:
            document['_id'] = str(document['_id'])
        return document
    except Exception as e:
        print(f"Error fetching document by id {id}: {e}")
        return None


def set_result_by_id(id, actual, success):
    try:
        result_entry = {
            "actual": actual,
            "success": success,
            "timestamp": datetime.now().isoformat()
        }

        tests_collection.update_one(
            {"_id": ObjectId(id)},
            {"$push": {"result": result_entry}}
        )
        print(f"Result added for test with id {id}")
    except Exception as e:
        print(f"Error updating result for document by id {id}: {e}")


def create_test(data):
    tests_collection.insert_one(data)


if __name__ == '__main__':
    get_tests_by_type()
