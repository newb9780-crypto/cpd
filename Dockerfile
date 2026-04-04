FROM python:3.10-slim

# સિસ્ટમ લાઈબ્રેરીઓ
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg gcc python3-dev build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

# લાઈબ્રેરીઓ ઇન્સ્ટોલ કરવાની પાકી રીત
RUN python -m pip install --upgrade pip
RUN python -m pip install --no-cache-dir -r requirements.txt

# બોટ રન કરવાની પાકી રીત
CMD ["python", "main.py"]
