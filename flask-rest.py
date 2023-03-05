import json

from flask import Flask, render_template
from flask import request
from neo4j import GraphDatabase
import pandas as pd

app = Flask(__name__)

uri = "bolt://localhost:7687"
driver = GraphDatabase.driver(uri, auth=("neo4j", "neo4jneo4j"))


def get_answer(fio):
    print(fio)
    command_line = f"""
        MATCH (p:Participant)-[r:PARTICIPATED_IN]->(e:Event)
        WHERE p.fio = '{fio}'
        RETURN p, e
    """
    with driver.session() as session:
        graph = session.run(command_line)
        data = pd.DataFrame([g.values() for g in graph], columns=graph.keys())

    json_data = []
    for i, row in data.iterrows():
        participant = row['p']['fio']
        event_id = row['e']['id_sobytiya']
        json_data.append({"fio": participant, "event_id": event_id})
    json_str = json.dumps(json_data, ensure_ascii=False)

    return json_str


@app.route('/search', methods=['POST', 'GET'])
def find_event():
    if request.method == "POST":
        if request.form.get('source') is not None:
            text = request.form['search_string']
            print(text)
            return get_answer(text)
        return get_answer(request.data.decode('utf-8'))
    elif request.method == "GET":
        return render_template("search.html")


@app.route('/')
def index():
    return '<h1>test workable</h1>'


if __name__ == "__main__":
    app.run(debug=True)
