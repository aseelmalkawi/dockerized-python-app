FROM python:3.11-slim

WORKDIR /app

COPY pyproject.toml poetry.lock* /app/

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && pip install poetry

RUN poetry install --no-root --only main

COPY . /app/

EXPOSE 80
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

ENTRYPOINT ["poetry", "run", "gunicorn", "--bind", "0.0.0.0:80", "book_shop.wsgi:application"]
