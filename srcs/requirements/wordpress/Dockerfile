FROM debian:buster-slim

# download php
RUN apt-get update -y \
    && apt-get install -y apt-utils \
    && apt-get upgrade -y \
    && apt-get -y install wget \
    && apt-get -y install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php7.3-mbstring

WORKDIR /var/www/
RUN mkdir wordpress

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
RUN mv phpMyAdmin-5.0.1-english phpmyadmin

# update & upgrade
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz

# allow root
RUN chown -R root:root /var/www/wordpress

# delete wp-config file base
RUN rm /var/www/wordpress/wp-config-sample.php

# add new config file
COPY ./wp-config.php /var/www/wordpress/

EXPOSE 9000