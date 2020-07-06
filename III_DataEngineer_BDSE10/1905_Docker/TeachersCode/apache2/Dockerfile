FROM ubuntu
MAINTAINER iii education "iiiedu@example.com"
RUN apt-get update
RUN apt-get install -y apache2
EXPOSE 80
ENTRYPOINT service apache2 restart && /bin/bash