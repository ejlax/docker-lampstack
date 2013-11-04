FROM ubuntu:latest
MAINTAINER John Fink <john.fink@gmail.com>
RUN apt-get update # DATE Sat Aug 31 20:25:54 EDT 2013
RUN apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install build-essential mysql-client mysql-server apache2.2-common apache2.2-bin apache2-utils apache2-mpm-prefork apache2 libapache2-mod-php5 pwgen vim-tiny php5-mysql
RUN easy_install supervisor
ADD ./start.sh /start.sh
ADD ./foreground.sh /etc/apache2/foreground.sh
ADD ./supervisord.conf /etc/supervisord.conf
RUN chmod 755 /start.sh
RUN chmod 755 /etc/apache2/foreground.sh
EXPOSE 80
CMD ["/bin/bash", "/start.sh"]
