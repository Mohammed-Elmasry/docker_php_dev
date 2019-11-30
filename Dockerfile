##############################################################
#  Building self contained docker image for php development
##############################################################

# base image on bionic beaver ubuntu 18.04
#########################
FROM ubuntu:18.04

# set the maintainer info
#########################
MAINTAINER Mohammed Almasry <mhanafy@arabiclocalizer.com>

# set Environment variable to solve interactivity problem
#########################
ARG DEBIAN_FRONTEND=noninteractive

# installing dependancies
#########################
RUN apt-get update && \
	apt-get install -y apache2 && \
	apt-get install -y php7.2-dev && \
	apt-get install -y mysql-server-5.7 && \
	apt-get install -y composer

# changing to workdir and copying instructions.txt there
#########################
WORKDIR /var/www/sigma.com
COPY instructions.txt .


# creating an index.html page
#########################
RUN ["/bin/bash", "-c" ,"touch index.html"]

# exposing a port for external communication
#########################
EXPOSE 8080/tcp

# running the welcome command
########################
CMD echo "welcome to your application"
