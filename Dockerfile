#!/bin/bash

FROM cimg/python:3.10.4

USER root

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PORT=8000
COPY requirements.txt .
EXPOSE 8000

RUN pip3 install --no-cache-dir -r requirements.txt \
    && groupadd -r myuser \
    && useradd -r -g myuser myuser \
    && rm -r -f /var/lib/apt/lists/*

COPY . .

ENTRYPOINT ["python3", "manage.py", "runserver", "0.0.0.0:$PORT"]

USER myuser
