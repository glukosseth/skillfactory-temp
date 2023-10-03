# Используем базовый образ Python 3
FROM python:3.9.6-alpine3.14

# Устанавливаем Flask, Psycopg2 и ConfigParser
RUN pip install Flask psycopg2-binary configparser

# Создаем директорию /srv/app внутри контейнера
RUN mkdir -p /srv/app

# Указываем рабочую директорию
WORKDIR /srv/app

# Копируем файлы web.py и web.conf в директорию /srv/app контейнера
COPY web.py /srv/app/
COPY conf/web.conf /srv/app/conf/

# Запускаем код приложения при старте контейнера
CMD ["python", "web.py"]
