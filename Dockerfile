FROM ubuntu:latest

# સિસ્ટમ અપડેટ અને જરૂરી ટૂલ્સ (Updated this line)
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    gcc \
    g++ \
    build-essential \
    python3-dev \
    libffi-dev \
    musl-dev \
    ffmpeg \
    aria2 \
    python3-pip \
    python3-setuptools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# એપ ડિરેક્ટરી સેટ કરવી
COPY . /app/
WORKDIR /app/

# લાઈબ્રેરીઓ ઇન્સ્ટોલ કરવી
RUN pip3 install --no-cache-dir --upgrade -r requirements.txt --break-system-packages

# બોટ રન કરવા માટે
CMD python3 main.py
