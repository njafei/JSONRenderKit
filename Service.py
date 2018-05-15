#-*-coding:utf-8-*-
import sys
import time
from flask import Flask,jsonify
app = Flask(__name__)

appJSON={}

translation={}

todo={}

newApi = {}

askList = {}

@app.route('/')
def hello_world():
    return 'JSON render Hello World!'

@app.route('/appjson', methods=['GET'])
def get_appjson():
    return jsonify(appJSON)

@app.route('/trans', methods=['GET'])
def get_translation():
    return jsonify(translation)

@app.route('/todo', methods=['GET'])
def get_todo():
    return jsonify(todo)

@app.route('/newApi', methods=['GET'])
def get_newApi():
    return jsonify(newApi)

@app.route('/askList', methods=['GET'])
def get_askList():
    return jsonify(askList)

if __name__ == '__main__':
    app.run()
