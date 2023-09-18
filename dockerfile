# Use the base image
FROM tiangolo/uvicorn-gunicorn-fastapi:python3.10

# Copy the requirements file and install dependencies
COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

# Copy the application code
COPY . .

# Set the working directory to /app/src
WORKDIR /app/src

# Add the wait-for-it script
ADD https://github.com/vishnubob/wait-for-it/raw/master/wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

# Define the command to start the FastAPI application
CMD ["/wait-for-it.sh", "mysql:3306", "--", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8500", "--reload"]
