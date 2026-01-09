FROM python:3.11-slim

WORKDIR /app

# Install runtime deps only
RUN pip install --no-cache-dir gunicorn

# Copy the wheel artifact
COPY dist/*.whl /app/

# Install your app
RUN pip install /app/*.whl

EXPOSE 80

ENTRYPOINT ["gunicorn", "--bind", "0.0.0.0:80", "book_shop.wsgi:application"]
