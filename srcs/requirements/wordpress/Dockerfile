FROM debian:buster-slim

EXPOSE 9000

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# download php
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get -y install wget \
    && apt-get install -y mariadb-client \
    && apt-get -y install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php7.3-mbstring php-fpm php-mysql

# WORKDIR /var/www/
RUN mkdir -p /var/www/wordpress

# install php
# RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz -P /var/www/
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
# RUN cd /var/www/ && tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
# RUN mv phpMyAdmin-5.0.1-english phpmyadmin

# set up php
# RUN rm /etc/php/7.3/fpm/pool.d/www.conf
COPY tools/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# update & upgrade
# RUN wget https://wordpress.org/latest.tar.gz
# RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz

# allow root
RUN chown -R root:root /var/www/wordpress

# configuration automatic wordpress command line interface
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# make it executable
RUN chmod +x wp-cli.phar
# move tp /usr/local/bin
RUN mv wp-cli.phar /usr/local/bin/wp

#  delete wp-config file base - no such file ??
# RUN rm /var/www/wordpress/wp-config.php
# add new config file
COPY tools/setup-config.php /var/www/wordpress/setup-config.php 
# mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/set_config_wp.sh /tmp/

ENTRYPOINT ["bash", "/tmp/set_config_wp.sh"]
