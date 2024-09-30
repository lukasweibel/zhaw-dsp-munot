import os

from flask import Flask, jsonify, send_from_directory

from backend.image_generation import generate_picture

app = Flask(__name__, static_folder='./../frontend/public', static_url_path='')


@app.route('/')
def index():
    return send_from_directory(app.static_folder, 'index.html')


@app.route('/hello', methods=['GET'])
def getHistory():
    data = 'Hello World!'
    return jsonify(data)


if __name__ == '__main__':
    app.run(debug=True, port=80)
