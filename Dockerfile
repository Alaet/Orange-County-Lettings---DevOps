FROM cimg/python:3.10.4

USER root

RUN groupadd -r myuser \
    && useradd -r -g myuser myuser \
    && pip3 install --no-cache-dir \
      docker-compose==1.12.0 \
      awscli==1.11.76 \
    && apt-get autoremove \
    && apt-get autoclean \
    && rm -r -f /var/lib/apt/lists/*


COPY . .

ENTRYPOINT ["echo", "python3 "]
CMD ["-m", "venv", "venv"]

USER myuser
