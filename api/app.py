import os

from flask import Flask, jsonify, request, send_from_directory

from backend.service import receive_layered_response

app = Flask(__name__, static_folder='./../frontend/public', static_url_path='')


@app.route('/')
def index():
    return send_from_directory(app.static_folder, 'index.html')


@app.route('/request', methods=['POST'])
def postRequest():
    data = request.get_json()
    user_input = data.get('text', 'No text provided')
    response_text = receive_layered_response(user_input)
    print("Returning following answer to user:\n" + response_text)
    return jsonify(response_text)


if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    app.run(debug=False, host='0.0.0.0', port=port)
