FROM python:3.10-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Вказуємо, що файл треба взяти з папки src/
COPY src/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо весь вміст папки src всередину контейнера
COPY src/ .

EXPOSE 8000

CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
