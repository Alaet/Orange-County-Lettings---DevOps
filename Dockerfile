FROM cimg/python:3.10.4

USER root

RUN pip3 install --no-cache-dir \
      docker-compose==1.12.0 \
      awscli==1.11.76 \
    && apt-get autoremove \
    && apt-get autoclean \
    && rm -r -f /var/lib/apt/lists/*

USER guest
