# Miles

## Install Python (if not already installed)
brew install python

## install az cli cmd
brew install azure-cli

## install docker
brew install docker

## Create a virtual environment
python3 -m venv venv

## Activate the virtual environment
source venv/bin/activate

## Verify Python version
python --version

## Verify pip version
pip --version

## Install Django
pip install django

## Verify Django installation
django-admin --version

## Create a new Django project
django-admin startproject mile_project .

## Launch the Django development server
python manage.py runserver

## Create a new Django app
python manage.py startapp mile_app

## Deactivate the virtual environment
deactivate

## List installed packages
pip freeze

## Update pip
pip install --upgrade pip

## Update Django
pip install --upgrade django

# docker build 
docker build ./src -t mile-app

# docker run
docker run -d -p 8080:8080 mile-app