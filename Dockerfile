FROM cimg/python:3.10.4

USER root
WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PORT=8000
COPY requirements.txt /app
EXPOSE 8000

RUN python3 -m venv venv \
    && cd venv/bin && . ./activate && cd ../.. \
    && pip3 install -r requirements.txt \
    && groupadd -r myuser \
    && useradd -r -g myuser myuser \
    && rm -r -f /var/lib/apt/lists/*

COPY . /app
CMD ["cd", "app"]
CMD ["cd", "venv/bin"]
CMD [".", "./activate"]
CMD ["cd", "../.."]
CMD ["python3", "manage.py", "runserver", "0.0.0.0:$PORT"]

USER myuser
