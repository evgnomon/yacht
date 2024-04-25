FROM python:3.9-slim

# Install Ansible
RUN pip install ansible

# Copy entry script
# RUN mkdir -p /opt/yacht
COPY . /opt/yacht

# Make the entry script executable
RUN chmod +x /opt/yacht/entrypoint.sh

ENTRYPOINT ["/opt/yacht/entrypoint.sh"]
