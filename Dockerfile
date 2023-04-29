FROM ubuntu:22.04
RUN apt-get update && apt-get install -y curl mailutils && apt-get clean
COPY check-status.sh /
RUN chmod +x /check-status.sh
ENTRYPOINT ["/check-status.sh"]