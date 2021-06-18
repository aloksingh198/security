FROM ubuntu:18.04
LABEL author="Alok Singh"
LABEL email="aloksingh.to@gmail.com"
RUN apt-get update -y && \
    apt-get install -y apache2
EXPOSE 80

