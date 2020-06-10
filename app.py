from flask import Flask, render_template, url_for, request, jsonify
import numpy as np
import pickle

app = Flask(__name__)
app.config['JSON_AS_ASCII'] = False

loaded_model = pickle.load(open("dog_disease_model.pkl", "rb"))

symptoms_dict = {
    "과호흡": 0,
    "급사": 1,
    "기침": 2,
    "염증": 3,
    "구토": 4,
    "탈모": 5,
    "무기력": 6,
    "발열": 7,
    "녹내장": 8,
    "거리감각불능": 9,
    "난청": 10,
    "요실금": 11,
    "설사": 12,
    "식욕부진": 13,
    "체중감소": 14
}

@app.route("/")
def home():
    input_vector = np.zeros(len(symptoms_dict))
    symp = []
    symptoms = request.args.get("symptoms")
    symptoms = symptoms.split(",")

    for symptom in symptoms:
        symp.append(symptoms_dict[symptom])

    input_vector[symp] = 1

    return jsonify({"data": loaded_model.predict([input_vector])[0]})

if __name__ == "__main__":
    app.debug = True
    app.run(host="127.0.0.1", port=80)