# Use the official Python image from the Docker Hub
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir google-analytics-data

# Accept the JSON secret as a build argument and write it to a file
ARG ENGINEERING_JSON
RUN echo "$ENGINEERING_JSON" > engineering-173019-49cb92815171.json

# Run hot-topic.py when the container launches
CMD ["python", "hot-topic.py"]
