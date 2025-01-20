# Use a lightweight Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the application code
COPY app.py .

# Install Flask
RUN pip install flask

# Expose the application port
EXPOSE 5000

# Define the command to run the application
CMD ["python", "app.py"]
