#!/bin/sh
echo "Waiting for postgres..."
./wait-for-it.sh ${DB_HOST}:${DB_PORT}
echo "PostgreSQL started"

python manage.py collectstatic --noinput
python manage.py migrate --noinput
echo "from django.contrib.auth.models import User;
User.objects.filter(email='$DJANGO_ADMIN_EMAIL').delete();
User.objects.create_superuser('$DJANGO_ADMIN_USER', '$DJANGO_ADMIN_EMAIL', '$DJANGO_ADMIN_PASSWORD')" | python manage.py shell
