FROM ubuntu:20.04
RUN apt-get update -y && \
    apt-get install -y apache2
EXPOSE 80

