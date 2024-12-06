FROM ubuntu:latest

# Update and install required packages
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    build-essential \
    libyaml-dev \
    && apt-get clean

# Upgrade pip to avoid compatibility issues
RUN pip3 install --upgrade pip

# Install PyYAML
RUN pip3 install PyYAML

# Copy your script and entrypoint
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]
