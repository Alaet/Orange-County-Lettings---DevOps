FROM cimg/python:3.10.4

USER root

COPY . .

RUN python3 -m venv venv \
    && cd venv/bin && . ./activate && cd ../.. \
    && pip3 install -r requirements.txt \
    && groupadd -r myuser \
    && useradd -r -g myuser myuser \
    && apt-get autoremove \
    && apt-get autoclean \
    && rm -r -f /var/lib/apt/lists/* \

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PORT=8000

EXPOSE 8000

CMD ["python3", "manage.py", "runserver", "0.0.0.0:$PORT"]

USER myuser
