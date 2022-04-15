FROM cimg/python:3.10.4

USER root

COPY . .

ENV PORT=8000

RUN groupadd -r myuser \
    && useradd -r -g myuser myuser \
    && pip3 install --no-cache-dir \
      docker-compose==1.12.0 \
      awscli==1.11.76 \
    && apt-get autoremove \
    && apt-get autoclean \
    && rm -r -f /var/lib/apt/lists/* \
    && python3 -m venv venv \
    && cd venv/bin && . ./activate && cd ../.. \
    && pip3 install -r requirements.txt

EXPOSE 8000

CMD python manage.py runserver 0.0.0.0:$PORT

USER myuser
