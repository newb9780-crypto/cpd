FROM ubuntu:latest

# System update and install necessary tools
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

# Set app directory
COPY . /app/
WORKDIR /app/

# Install python libraries (Fixed the exit code 1 error here)
RUN pip3 install --no-cache-dir --upgrade -r requirements.txt --break-system-packages

# Command to run the bot
# Note: જો તમારી મેઈન ફાઈલનું નામ અલગ હોય તો અહિયાં બદલજો
CMD python3 modules/main.py
