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

chat_collection = db['chats']


def get_tests_by_type():
    documents = list(tests_collection.find())
    for document in documents:
        document['_id'] = str(document['_id'])
    return documents


def get_all_chats():
    documents = list(chat_collection.find())
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


def persist_chat(user_input, bot_answer, chat_id):
    try:
        existing_chat = chat_collection.find_one({"chat_id": chat_id})

        message_entry = {
            "timestamp": datetime.now().isoformat(),
            "messages": [
                {"role": "user", "message": user_input,
                    "timestamp": datetime.now().isoformat()},
                {"role": "bot", "message": bot_answer,
                    "timestamp": datetime.now().isoformat()}
            ]
        }

        if not existing_chat:
            new_chat_entry = {
                "chat_id": chat_id,
                "messages": message_entry["messages"]
            }
            chat_collection.insert_one(new_chat_entry)
            print(f"New chat entry created with chat_id {chat_id}")
        else:
            chat_collection.update_one(
                {"chat_id": chat_id},
                {"$push": {"messages": {"role": "user", "message": user_input,
                                        "timestamp": datetime.now().isoformat()}}},
            )
            chat_collection.update_one(
                {"chat_id": chat_id},
                {"$push": {"messages": {"role": "bot", "message": bot_answer,
                                        "timestamp": datetime.now().isoformat()}}},
            )
            print(f"Messages added to existing chat with chat_id {chat_id}")

    except Exception as e:
        print(f"Error persisting chat for chat_id {chat_id}: {e}")


def create_test(data):
    tests_collection.insert_one(data)


if __name__ == '__main__':
    get_tests_by_type()
