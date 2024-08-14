# Justfile for Django Rest Framework project with Poetry

# Set the shell to bash
# set shell := ['bash', '-c']

# Task to create the virtual environment and install dependencies
create-venv:
    poetry install
    echo "Virtual environment created and dependencies installed."

# Task to lock dependencies and create the poetry.lock file
lock-deps:
    poetry lock
    echo "Dependencies locked."

# Task to initialize a new Django project named 'hello_django'
init-django:
    poetry run django-admin startproject hello_django .
    echo "Django project 'hello_django' initialized."

# Task to create a Django app named 'api' (or any other name)
create-app:
    @echo "Enter app name:"
    @read app_name; \
    poetry run python manage.py startapp $$app_name; \
    echo "Django app '$$app_name' created."

# Task to run the Django development server
runserver:
    poetry run python manage.py runserver
    echo "Django development server started."

# Task to apply migrations
migrate:
    poetry run python manage.py migrate
    echo "Migrations applied."

makemigrations:
    poetry run python manage.py makemigrations
    echo "Migrations created."

# Task to create a superuser for the Django admin
createsuperuser:
    poetry run python manage.py createsuperuser
    echo "Superuser created."

# Task to run tests
test:
    poetry run python manage.py test
    echo "Tests executed."

# Task to collect static files
collectstatic:
    poetry run python manage.py collectstatic --noinput
    echo "Static files collected."

# Task to install Django Rest Framework
install-drf:
    poetry add djangorestframework
    echo "Django Rest Framework installed."

# Meta-task to initialize the full environment
init: create-venv lock-deps init-django
    echo "Environment initialized with Django and Django Rest Framework."
