# Use an official Python image
FROM python:3.9-slim-buster

ENV PYTHONUNBUFFERED=1
ENV ALLOWED_HOSTS=*
# Set working directory
WORKDIR /app

# Copy requirements file
COPY requirements.txt .
# Copy script to container
COPY docker_run.sh /tmp/docker_run.sh

# Install dependencies
RUN pip install -r requirements.txt
RUN /bin/bash /tmp/docker_run.sh

# Copy application code
COPY . .

# Expose port
EXPOSE 8080

# Run command
CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]