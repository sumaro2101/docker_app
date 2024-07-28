FROM python:3.12-alpine3.20

RUN apk add postgresql-client build-base postgresql-dev
RUN adduser --disabled-password app_user

COPY requirements.txt /temp/requirements.txt
RUN pip install -r /temp/requirements.txt

COPY app_services /app_services
WORKDIR /app_services
EXPOSE 8000

USER app_user
