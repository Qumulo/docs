# Use the official Python image from the Docker Hub
FROM python:3.11-slim

# Update pip as necessary
RUN pip install --no-cache-dir --upgrade "pip==26.2.1"

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir google-analytics-data packaging

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Run hot-topic.py when the container launches
CMD ["python", "hot-topic.py"]
