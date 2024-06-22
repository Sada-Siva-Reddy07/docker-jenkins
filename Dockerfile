# Use Amazon Linux base image
FROM amazonlinux:latest

# Update packages and install dependencies
RUN yum update -y && \
    yum install -y \
    python3 \
    python3-pip \
    && yum clean all

# Set working directory
WORKDIR /app

# Copy application code
COPY . /app

# Example command to run your application
CMD ["python3", "app.py"]
