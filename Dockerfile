FROM cimg/python:3.10.4

USER root
WORKDIR /app
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PORT=8000
COPY requirements.txt /app
EXPOSE 8000

RUN docker login \
    && pip3 install --no-cache-dir -r requirements.txt \
    && groupadd -r myuser \
    && useradd -r -g myuser myuser \
    && rm -r -f /var/lib/apt/lists/*

COPY . /app

ENTRYPOINT ["python3"]

CMD ["manage.py", "runserver", "0.0.0.0:8000"]

USER myuser
