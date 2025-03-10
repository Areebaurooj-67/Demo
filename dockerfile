# Use the official Python image
FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files
COPY . .

# Expose port 8000
EXPOSE 8000

# Command to run the app (updated filename)
CMD ["uvicorn", "dateandtime:app", "--host", "0.0.0.0", "--port", "8000"]
