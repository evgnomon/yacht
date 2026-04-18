FROM ghcr.io/evgnomon/ark:latest
COPY . /opt/yacht
RUN chmod +x /opt/yacht/entrypoint.sh
ENTRYPOINT ["/opt/yacht/entrypoint.sh"]
