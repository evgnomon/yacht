FROM ghcr.io/evgnomon/ark:main
COPY . /opt/yacht
RUN chmod +x /opt/yacht/entrypoint.sh
ENTRYPOINT ["/opt/yacht/entrypoint.sh"]
