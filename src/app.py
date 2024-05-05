import os
from flask import Flask, request
from transformers import pipeline

app = Flask(__name__)


@app.route("/")
def display_app_data():
    return {
            "name": "Sentiment Analysis in Portuguese",
            "version": os.getenv('SAP_VERSION', 'v0.0.0')
    }


@app.post("/analyze")
def analyze():
    distilled_student_sentiment_classifier = pipeline(
        model="lxyuan/distilbert-base-multilingual-cased-sentiments-student",
        return_all_scores=True
    )
    print(request.data, request.json)
    sentence_to_analyze = request.json['sentence']
    if not sentence_to_analyze:
        return "Sentence not provied", 400
    results = distilled_student_sentiment_classifier(sentence_to_analyze)
    return results
