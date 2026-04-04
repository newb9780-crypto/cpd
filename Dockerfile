FROM ubuntu:latest

# સિસ્ટમ અપડેટ અને જરૂરી ટૂલ્સ ઇન્સ્ટોલ કરવા
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

# બધી જરૂરી લાઈબ્રેરીઓ એકસાથે ઇન્સ્ટોલ કરવી
RUN pip3 install --no-cache-dir --upgrade \
    pyrogram \
    tgcrypto \
    yt-dlp \
    requests \
    aiohttp \
    aiofiles \
    --break-system-packages

# બોટ રન કરવા માટે (તમારી ફાઈલ સીધી બહાર છે એટલે main.py)
CMD python3 main.py
