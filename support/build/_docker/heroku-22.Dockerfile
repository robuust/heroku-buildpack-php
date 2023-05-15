FROM ghcr.io/robuust/heroku:22-build

WORKDIR /app
ENV WORKSPACE_DIR=/app/support/build
ENV PATH=/app/support/build/_util:$PATH
ENV S3_BUCKET=robuust-heroku-php
ENV S3_PREFIX=dist-heroku-22-develop/
ENV S3_REGION=s3.eu-west-1
ENV STACK=heroku-22
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y python3-pip unixodbc-dev

COPY requirements.txt /app/requirements.txt

RUN pip3 install -r /app/requirements.txt

COPY . /app
