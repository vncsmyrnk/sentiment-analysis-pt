![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![TensorFlow](https://img.shields.io/badge/TensorFlow-%23FF6F00.svg?style=for-the-badge&logo=TensorFlow&logoColor=white)
![Keras](https://img.shields.io/badge/Keras-%23D00000.svg?style=for-the-badge&logo=Keras&logoColor=white)
<br>
![CI](https://github.com/clocked-app/calculations-api/actions/workflows/ci.yml/badge.svg)

# Sentiment Analysis in Portuguese Sentences

API for performing sentiment analysis in portuguese sentences using NLP.

This project aims at analyzing and predicting sentiments associated with texts written in the Portuguese language through NLP. This initiative takes into account the absence of similar tools in this language, as much of the research and applications focus on the English language. Technically, it is an API that returns a sentiment analysis related to certain inputs. To do this, pretrained models and tools for working with tasks related to natural language processing are used.

This project is based on [TensorFlow](https://www.tensorflow.org/) and [Transformers](https://huggingface.co/docs/transformers/index) for the NLP features and [Flask](https://flask.palletsprojects.com/en/3.0.x/) for routing.

The NLP model used is [distilbert-base-multilingual-cased-sentiments-student](https://huggingface.co/lxyuan/distilbert-base-multilingual-cased-sentiments-student), available on the 🤗 Hugging Face Hub.

## Run with Docker

```bash
docker build --tag sentiment-analysis-pt
docker run --rm -p 5000:5000 sentiment-analysis-pt
```

## Development

```bash
docker build --target base --tag sentiment-analysis-pt-dev
docker run --rm -it -v "$(pwd)"/src:/var/app/ -p 5000:5000 sentiment-analysis-pt-dev bash
pip install -r requirements.txt --ignore-installed
flask --app app run --host 0.0.0.0
```

## Use case

```bash
curl -X POST localhost:5000/analyze -H "Content-Type: application/json" -d '{"sentence": "O produto atendeu às minhas necessidades"}'
```

Example respose:

```json
[
  [
    {
      "label": "positive",
      "score": 0.7563667297363281
    },
    {
      "label": "neutral",
      "score": 0.09914696961641312
    },
    {
      "label": "negative",
      "score": 0.1444862186908722
    }
  ]
]
```

## Project steps

- [x] REST API minimal app
- [x] CI Pipeline
- [x] Integranting NLP sentiment classification
- [ ] CD Pipeline
- [ ] Developing custom NLP Model
