# Base image: Linux with Python 3.12 already installed
FROM python:3.12-slim

# Working directory inside the container
WORKDIR /app

# Copy the application from the project into the image
COPY app/app.py .

# Check that the code has no syntax errors during the build
RUN python -m py_compile app.py

# The application listens on port 5000
EXPOSE 5000

# Command that runs when the container starts
CMD ["python", "app.py"]
