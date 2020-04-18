from getter import drive
import json

from flask import Flask
from flask_restful import Resource, Api




app = Flask(__name__)

@app.route('/',  methods=['GET'])
def get_all_data():
    with open("getter/data/data.json", "r", encoding="utf-8") as f:
        data = json.load(f)
    return data
@app.route('/relations', methods=['GET'])
def get_relations():
    with open("getter/data/relations.json", "r", encoding="utf-8") as f:
        rel_data = json.load(f)
    return rel_data

@app.route('/relations/<parent>')
def childs(parent):
    try:
        rel_data = get_relations()[parent]
        new_res = dict()
        childs = []
        
        for child in rel_data:
            c_data = get_data_of(child)
            childs.append({child:c_data})
        
        new_res.update({"childs": childs})

    except KeyError:
        new_res = dict({"childs":[0]})
    return new_res

@app.route('/relations/root')
def childs_root():
    try:
        res = childs("19GLVDseQyMm8YxDxaMxebHvkp2o821E3")
    except KeyError:
        res = dict({"childs":[0]})
    return res

@app.route('/<ElementId>')
def get_data_of(ElementId):
    data = get_all_data()
    try:
        res = data[ElementId]
    except KeyError:
        res = "Not Found"
    return res

if __name__ == '__main__':
    # drive.main()
    app.run(host= '0.0.0.0')
