FROM python:3-slim

# Set working directory
WORKDIR /usr/src

# Copy in required files
COPY app.py .
COPY importschema.json .
COPY requirements.txt .

# Install packages
RUN pip install -r requirements.txt

# Create a new group "appgroup" and add a new user "appuser"
RUN groupadd appgroup && \
    useradd -g appgroup appuser

RUN chown -R appuser:appgroup /usr/sr

# Change to non-root privilege
USER appuser

# Run application
CMD python3 -u app.py

# Expose the port
EXPOSE 5000
