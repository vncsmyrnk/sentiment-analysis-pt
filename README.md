![CI](https://github.com/clocked-app/calculations-api/actions/workflows/ci.yml/badge.svg)

# Sentiment Analysis on Portuguese Sentences

API for performing sentiment analysis on portuguese sentences using NLP.

## Run with Docker

```bash
docker build --tag sentiment-analysis-pt
docker run --rm -p 5000:5000 sentiment-analysis-pt
```

## Development

```bash
docker build --target base --tag sentiment-analysis-pt-dev
docker run --rm --it -v "$(pwd)":/var/app/ -p 5000:5000 sentiment-analysis-pt-dev bash
pip install -r requirements.txt
flask --app app run --host=0.0.0.0
```

## Project steps

- [x] REST API minimal app
- [x] CI Pipeline
- [ ] Integranting NLP sentiment classification
- [ ] CD Pipeline
