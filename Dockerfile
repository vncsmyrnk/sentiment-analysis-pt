# Stage 1: Base image
FROM python:3.9-alpine as base
RUN apk add bash
SHELL ["/bin/bash", "-c"]
WORKDIR /var/app/
COPY src/ .

# Stage 2: Optmized deploy-ready image
FROM python:3.9-alpine
WORKDIR /var/app/
COPY --from=base /var/app .
RUN pip install -r requirements.txt
EXPOSE 5000
ENTRYPOINT ["gunicorn", "--bind=0.0.0.0:5000", "app:app"]
