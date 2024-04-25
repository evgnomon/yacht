FROM python:3.9-slim

# Install Ansible
RUN pip install ansible

# Copy entry script
COPY entrypoint.sh /entrypoint.sh

# Make the entry script executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
