FROM python:3.11-slim

WORKDIR /app

# Install runtime deps only
RUN pip install --no-cache-dir gunicorn

# Copy the wheel artifact
COPY book_shop-0.1.0-py3-none-any.* /app/

# Install your app
RUN pip install /app/*.whl 
#&& sudo apt-get install unzip && unzip book_shop-0.1.0-py3-none-any.tar.gz

EXPOSE 80
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

ENTRYPOINT ["gunicorn", "--bind", "0.0.0.0:80", "book_shop.wsgi:application"]
