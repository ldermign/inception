FROM debian:buster-slim

# download php
RUN apt-get update \
    && apt-get install -y apt-utils \
    && apt-get upgrade -y \
    && apt-get -y install wget \
    && apt-get install -y mariadb-server \
    && apt-get -y install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php7.3-mbstring

WORKDIR /var/www/html/

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
RUN mv phpMyAdmin-5.0.1-english phpmyadmin

# update & upgrade
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz

# RUN service php7.3-fpm start
# RUN service mysql start

# # Configure a wordpress database
# RUN echo "CREATE DATABASE wordpress;" | mysql -u root
# RUN echo "CREATE USER 'utilisateur'@'%';" | mysql -u root
# RUN echo "GRANT ALL ON wordpress.* TO 'utilisateur'@'%' WITH GRANT OPTION;" | mysql -u root
# RUN echo "FLUSH PRIVILEGES;" | mysql -u root

# RUN rm /var/www/html/wordpress/wp-config-sample.php
# COPY ./srcs/requirements/wordpress/conf/wp-config.php /var/www/html/wordpress/


EXPOSE 9000