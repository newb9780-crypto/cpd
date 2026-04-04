FROM ubuntu:latest

# Update system and install dependencies
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    gcc \
    libffi-dev \
    musl-dev \
    ffmpeg \
    aria2 \
    python3-pip \
    python3-setuptools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
COPY . /app/
WORKDIR /app/

# Install python libraries from requirements.txt
RUN pip3 install --no-cache-dir --upgrade -r requirements.txt

# Command to run the bot
CMD python3 modules/main.py

