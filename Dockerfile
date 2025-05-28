# Use official Python image
FROM python:3.10

# Set the working directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY . .

# Expose port FastAPI runs on
EXPOSE 8000

# Run DB init + start FastAPI server
CMD ["sh", "-c", "python app/init_db.py && uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload"]
