FROM debian:buster
MAINTAINER Jereligi <jereligi@student.42.fr>

RUN apt-get update && apt-get upgrade && apt-get install -y nginx vim mariadb-server wget
RUN apt-get install -y php php-fpm php-gd php-mysql php-cli php-curl 
RUN wget https://fr.wordpress.org/latest-fr_FR.tar.gz
RUN tar -zxvf latest-fr_FR.tar.gz
RUN mv wordpress /var/www/html/wordpress
RUN chown -R www-data:www-data /var/www/html/wordpress/
RUN chmod -R 755 /var/www/html/wordpress/
RUN rm latest-fr_FR.tar.gz
RUN rm var/www/html/index.nginx-debian.html

ADD ./srcs/my.cnf ./utils/my.cnf
ADD ./srcs/php.ini ./etc/php/7.3/fpm/php.ini
ADD ./srcs/default ./etc/nginx/sites-available/default
ADD ./srcs/wordpress ./etc/nginx/sites-available/wordpress
ADD ./srcs/info.php ./var/www/html/info.php
ADD ./srcs/script.sh ./utils/script.sh
ADD ./srcs/init.sh init.sh

RUN sh utils/script.sh
RUN rm -r ./utils
