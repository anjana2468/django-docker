FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the entire project directory to /app
COPY . /app

# Update and install Python and pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    apt-get clean

# Create a virtual environment and install the required dependencies
RUN python3 -m venv /opt/venv && \
    /opt/venv/bin/pip install --upgrade pip && \
    /opt/venv/bin/pip install -r requirements.txt

# Set the environment path to the virtual environment
ENV PATH="/opt/venv/bin:$PATH"

# Expose the port your app runs on
EXPOSE 8000

# Define the entry point to run your Python app
ENTRYPOINT [ "python3" ]
CMD [ "manage.py", "runserver", "0.0.0.0:8000" ]
