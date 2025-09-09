FROM coqui/tts:latest

WORKDIR /app

# Install any additional dependencies if needed.
# For example, if you need specific Python packages for your training scripts:
# RUN pip install --no-cache-dir your-package-name

# Expose the default port for the TTS server
EXPOSE 5002

# Command to start the TTS server (you might adjust this based on your specific needs)
# This example starts a basic server. For training, you'd typically run specific Python scripts.
# CMD ["tts-server", "--model_path", "/app/models/your_model.pth", "--config_path", "/app/models/your_config.json"]
# For training, you would typically run a Python script like:
# ENTRYPOINT ["python", "TTS/bin/train_tts.py"]
# However, for a general-purpose container that can be used for both,
# it's better to leave the CMD flexible or provide a script.

# Let's provide a simple entrypoint that can be overridden
ENTRYPOINT ["/bin/bash"]
