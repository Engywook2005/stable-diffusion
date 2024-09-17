FROM python:3.9-slim

WORKDIR /app

# Install necessary system dependencies
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    libsm6 \
    libxext6 \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip to the latest version
RUN pip install --upgrade pip

# Install Python dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

# Install imwatermark separately
RUN pip install git+https://github.com/ShieldMnt/invisible-watermark.git

# Ensure model directory exists
RUN mkdir -p models/ldm/stable-diffusion-v1

# Download the Stable Diffusion model checkpoint
RUN wget -O models/ldm/stable-diffusion-v1/model.ckpt https://huggingface.co/CompVis/stable-diffusion-v-1-4-original/resolve/main/sd-v1-4.ckpt

# Default command (can be customized later)
CMD ["bash"]
