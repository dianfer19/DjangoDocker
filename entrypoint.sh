#!/bin/sh
#exec >> /app/logs/django.log 2>&1
echo "Generando migraciones..."
python manage.py makemigrations
python manage.py migrate


python manage.py runserver 0.0.0.0:8000
echo "Inicio la aplicacion django..."