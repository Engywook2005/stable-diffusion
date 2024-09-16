FROM python:3.8-slim

WORKDIR /app

# Install necessary system dependencies
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    libsm6 \
    libxext6 \
    wget \   
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Default command (can be customized later)
CMD ["bash"]
