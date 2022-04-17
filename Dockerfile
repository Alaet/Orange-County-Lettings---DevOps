#!/bin/bash

FROM cimg/python:3.10.4

USER root

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ARG SECRET_KEY
ARG ALLOWED_HOSTS
ARG DEBUG
ENV SECRET_KEY=$SECRET_KEY
ENV ALLOWED_HOSTS=$ALLOWED_HOSTS
ENV DEBUG=$DEBUG
ENV PORT=8000
COPY . .

RUN pip3 install --no-cache-dir -r requirements.txt \
    && python3 manage.py collectstatic --no-input \
    && groupadd -r myuser \
    && useradd -r -g myuser myuser \
    && rm -r -f /var/lib/apt/lists/*

EXPOSE 8000

CMD ["python3 manage.py runserver 0.0.0.0:8000"]

USER myuser
