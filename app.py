from flask import Flask, render_template, url_for, request, session, jsonify
import pandas as pd
import numpy as np
import pickle

app = Flask(__name__)
app.secret_key = 'selkjfoiwejfoiwjfoijiofj'
loaded_model = pickle.load(open("dog_disease_model.pkl", "rb"))

from sklearn.ensemble import RandomForestClassifier

# Train, Test split
from sklearn.model_selection import train_test_split

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
    # 여기 추가한 증상 값이 들어감
}

symp = []
_symp = []

@app.route("/reset", methods=['get'])
def reset():
    df = pd.read_csv('data/clean/dog_disease_train.csv', encoding='cp949')
    
    df["테스트"] = 0
    
    cols = df.columns.to_list()
    tmp = cols[-1]
    print("tmp 무슨 값?", tmp)
    
    del cols[-1]
    cols.insert(-1, tmp)

    df = df[cols]

    df.to_csv("data/clean/dog_disease_train.csv", mode ='w', index=None, encoding='cp949')

    # X = df.iloc[:, :-1]
    # y = df['질병명']
    # X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=20)
    # rf_clf = RandomForestClassifier()
    #
    # rf_clf.fit(X_train, y_train)
    #
    # with open("model7-test.pkl",'wb') as fid:
    #     pickle.dump(rf_clf, fid)
    #
    # print(rf_clf)
    # print("Accuracy on split test: ", rf_clf.score(X_test,y_test))
    #
    # print("과연")
    #
    return "증상 추가 완료!"

@app.route("/test", methods=['post'])
def home():
    global symp
    global _symp
    input_vector = np.zeros(len(symptoms_dict)) # 외부 값이므로 안 바뀐다.

    # print("form:  ",request.form)
    # print("from 길이:", len(request.form))

    # print("symp를 비게할 경우 상태", symp )
    for i in range(len(request.form)):
        # k = i+1;
        symp.append(request.form["증상" + str(i)]) # value 값 저장
    print("symp 값 : ", symp)

    if(len(request.form)!=0): # 세션이 비어 있을 경우 값을 추가하여 넣어준다
        for i, j in enumerate(symp):
            if(symp[i] != ''):
                _symp.append(symptoms_dict[j]) # 병명 저장

        input_vector[_symp] = 1 # 해당 인덱스 1로 표시

        return jsonify({
            "data": loaded_model.predict([input_vector])[0],
            "기관지 확장증": loaded_model.predict_proba([input_vector])[0][0],
            "마카다미아너트 중독증": loaded_model.predict_proba([input_vector])[0][1],
            "코로나 바이러스": loaded_model.predict_proba([input_vector])[0][2],
            })

    else: # 세션이 비어 있지 않을 경우
        input_vector[_symp] = 1 # 해당 인덱스 1로 표시
        symp = []
        _symp = []
        print("마지막 symp : ", symp)

        return jsonify({
            "data": loaded_model.predict([input_vector])[0],
            "기관지 확장증": loaded_model.predict_proba([input_vector])[0][0],
            "마카다미아너트 중독증": loaded_model.predict_proba([input_vector])[0][1],
            "코로나 바이러스": loaded_model.predict_proba([input_vector])[0][2],
            })

@app.route("/result", methods=['post','get'])
def home2():
    print("여긴오니?")

    input_vector = home()
    print("input_vector : ", input_vector)
    print('줴발s\n')
    print(input_vector["input_vector"])

    return jsonify({
            "data": loaded_model.predict([input_vector["input_vector"]])[0],
            "percent1": loaded_model.predict_proba([input_vector["input_vector"]])[0][0],
            "percent2": loaded_model.predict_proba([input_vector["input_vector"]])[0][1],
            "percent3": loaded_model.predict_proba([input_vector["input_vector"]])[0][2],
            })

app.run(host="0.0.0.0", port=80)