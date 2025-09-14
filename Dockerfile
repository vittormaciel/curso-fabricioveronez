# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY src/requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application's code into the container at /app
COPY src/ .

# Expose the port the app runs on
EXPOSE 8000

# Define the command to run the application
# Use gunicorn for production. The number of workers is a suggestion.
CMD ["gunicorn", "--workers", "4", "--bind", "0.0.0.0:8000", "main:app"]
