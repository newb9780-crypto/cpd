FROM python:3.10-slim-buster

# સિસ્ટમ પેકેજ અને ટૂલ્સ
RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
    ffmpeg \
    gcc \
    python3-dev \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# એપ સેટઅપ
WORKDIR /app
COPY . /app

# લાઈબ્રેરીઓ ઇન્સ્ટોલ કરવી (Using simple pip install)
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

# બોટ રન કરવો
CMD ["python3", "main.py"]
