#!/bin/bash

# Download model weights if they don’t already exist
if [ ! -f "/app/models/model.ckpt" ]; then
  echo "Downloading model weights..."
  wget -O /app/models/model.ckpt https://huggingface.co/CompVis/stable-diffusion-v-1-4-original/resolve/main/sd-v1-4.ckpt
fi

# Run Stable Diffusion script
exec "$@"
