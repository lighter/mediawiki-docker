#On choisit Debian
FROM debian:latest

MAINTAINER DiouxX "github@diouxx.be"

#Ne pas poser de question à l'installation
ENV DEBIAN_FRONTEND noninteractive

RUN apt update \
&& apt -y install \
apache2 \
php5 \
php5-mysql \
php5-ldap \
php5-xcache \
imagemagick \
php5-imagick \
wget \
git \
vim

#Copy and run mediwiki start script
COPY wiki-start.sh /opt
RUN chmod +x /opt/wiki-start.sh
ENTRYPOINT ["/opt/wiki-start.sh"]

#Ports
EXPOSE 80 443 9101
