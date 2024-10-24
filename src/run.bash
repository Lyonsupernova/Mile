# Create a new directory for your project
mkdir Mile
cd Mile

# Install Python (if not already installed)
brew install python

# Create a virtual environment
python3 -m venv venv

# Activate the virtual environment
source venv/bin/activate

# Verify Python version
python --version

# Verify pip version
pip --version

# Install Django
pip install django

# Verify Django installation
django-admin --version

# Create a new Django project
django-admin startproject mile_project .

# Launch the Django development server
python manage.py runserver

# Create a new Django app
python manage.py startapp mile_app

# Deactivate the virtual environment
deactivate

# List installed packages
pip freeze

# Update pip
pip install --upgrade pip

# Update Django
pip install --upgrade django