FROM debian:buster
MAINTAINER Jereligi <jereligi@student.42.fr>

RUN apt-get update && apt-get upgrade && apt-get install -y nginx vim mariadb-server mariadb-client wget
RUN apt-get install -y php php-fpm php-gd php-mysql php-cli php-curl 
RUN wget https://fr.wordpress.org/latest-fr_FR.tar.gz
RUN tar -zxvf latest-fr_FR.tar.gz
RUN mv wordpress /var/www/html/wordpress
RUN chown -R www-data:www-data /var/www/html/wordpress/
RUN chmod -R 755 /var/www/html/wordpress/
RUN rm latest-fr_FR.tar.gz
RUN rm var/www/html/index.nginx-debian.html && rm /var/www/html/wordpress/wp-config-sample.php

ADD ./srcs/php.ini ./etc/php/7.3/fpm/php.ini
ADD ./srcs/default ./etc/nginx/sites-available/default
ADD ./srcs/wordpress ./etc/nginx/sites-available/wordpress
ADD ./srcs/info.php ./var/www/html/info.php
ADD ./srcs/wp-config.php ./var/www/html/wordpress/wp-config.php
ADD ./srcs/create_database create_database
ADD ./srcs/init.sh init.sh
ADD ./srcs/init_db.sh init_db.sh

RUN sh init_db.sh
