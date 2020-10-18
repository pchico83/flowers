#!/bin/sh
if [ "$DATABASE" = "postgres" ]
then
    while ! nc -z $DB_HOST $DB_PORT; do
      echo "Waiting for postgres..."
      sleep 0.1
    done
    
    echo "PostgreSQL started"
fi

echo "A"
python manage.py collectstatic --noinput
echo "B"
python manage.py migrate --noinput
echo "C"
echo "from django.contrib.auth.models import User;
User.objects.filter(email='$DJANGO_ADMIN_EMAIL').delete();
User.objects.create_superuser('$DJANGO_ADMIN_USER', '$DJANGO_ADMIN_EMAIL', '$DJANGO_ADMIN_PASSWORD')" | python manage.py shell
