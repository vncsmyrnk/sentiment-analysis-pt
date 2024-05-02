import os
from flask import Flask

app = Flask(__name__)


@app.route("/")
def hello():
    return {
            "name": "Sentiment Analysis in Portuguese",
            "version": os.getenv('SAP_VERSION', 'v0.0.0')
    }
