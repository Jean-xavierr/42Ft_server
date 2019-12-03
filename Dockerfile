FROM debian:buster
MAINTAINER Jereligi <jereligi@student.42.fr>
RUN apt-get update && apt-get upgrade && apt-get -y install vim && apt-get -y install nginx
RUN apt-get install -y wordpress && apt-get install -y mariadb-server && apt-get install -y wget

ADD ./srcs/my.cnf ./utils/my.cnf 
ADD ./srcs/script.sh ./utils/script.sh

RUN sh utils/script.sh
RUN rm -r ./utils && service nginx restart && service mysql restart
##RUN apt-get install unzip
##RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.zip
##RUN unzip phpMyAdmin-4.9.0.1-all-languages.zip && rm phpMyAdmin-4.9.0.1-all-languages.zip
##RUN mv phpMyAdmin-4.9.0.1-all-languages /usr/share/phpmyadmin
##CMD ["nginx", "-g", "daemon off;"]
