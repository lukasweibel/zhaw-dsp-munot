import os

from flask import Flask, jsonify, request, send_from_directory
from backend.test.integration_tests import run_test_by_id, run_tests_by_type
from backend.service import receive_layered_response
from backend.db.db_accessor import get_tests_by_type, create_test, persist_chat, get_all_chats, get_types, create_test_type, get_tests, get_testruns_by_type, get_testruns_with_results_by_type

app = Flask(__name__, static_folder='./../frontend/public', static_url_path='')


@app.route('/')
def index():
    return send_from_directory(app.static_folder, 'index.html')


@app.route('/request', methods=['POST'])
def postRequest():
    data = request.get_json()
    chat_id = data.get('chatId')
    user_input = data.get('text', 'No text provided')
    response_text = receive_layered_response(user_input)
    if chat_id:
        persist_chat(user_input, response_text, chat_id)

    print("Returning following answer to user:\n" + response_text)
    return jsonify(response_text)


@app.route('/test/create', methods=['POST'])
def createTest():
    data = request.get_json()
    create_test(data)
    return jsonify()


@app.route('/test/type/run/<type>', methods=['POST'])
def runOneTestByType(type):
    results = run_tests_by_type(type)
    return jsonify(results)


@app.route('/test/run/<id>', methods=['POST'])
def runOneTestById(id):
    success, actual = run_test_by_id(id)
    return jsonify({
        "success": success,
        "actual": actual
    })


@app.route('/test', methods=['GET'])
def getAllTests():
    tests = get_tests()
    return jsonify(tests)


@app.route('/test/run/<type>', methods=['GET'])
def getAllTestrunsByType(type):
    testruns = get_testruns_with_results_by_type(type)
    return jsonify(testruns)


@app.route('/test/type', methods=['GET'])
def getAllTestTypes():
    test_types = get_types()
    print(test_types)
    return jsonify(test_types)


@app.route('/test/type', methods=['POST'])
def addTestType():
    data = request.get_json()
    create_test_type(data)
    return jsonify()


@app.route('/history', methods=['GET'])
def getAllChats():
    chats = get_all_chats()
    return jsonify(chats)


if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(debug=False, host='0.0.0.0', port=port)
