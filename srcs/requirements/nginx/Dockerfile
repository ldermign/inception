FROM debian:buster-slim

RUN apt-get update \
    && apt-get install -y apt-utils \
    && apt-get upgrade -y \
    && apt-get update \
    && apt-get -y install vim \
    && apt-get -y install wget \
    && apt-get -y install nginx

# phpppppp
# WORKDIR /var/www/html/
# RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
# RUN tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
# RUN mv phpMyAdmin-5.0.1-english phpmyadmin
# RUN wget https://wordpress.org/latest.tar.gz
# RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
# fin phppppp

RUN mkdir /etc/nginx/ssl
RUN chmod 755 -R /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=./O=42/CN=ldermign.42.fr" -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt

RUN rm /var/www/html/index.nginx-debian.html
COPY ./requirements/info.php /var/www/html/

# RUN rm /var/www/html/wordpress/wp-config-sample.php
# RUN rm /var/www/html/phpmyadmin/config.sample.inc.php
# COPY ../wordpress/wp-config.php /var/www/html/wordpress/
# RUN cp ../../config.inc.php /var/www/html/phpmyadmin/

# RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN chown -R www-data:www-data /var/www/html
RUN chmod 755 -R /var/www

# Remove the default Nginx configuration file and add cert directory
RUN rm -v /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-available/default
RUN rm /etc/nginx/sites-enabled/default
# Add nginx config file
COPY ./requirements/nginx.conf /etc/nginx/
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

RUN service nginx start

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

# docker build -t nginx_test .
# docker images
# docker run -t -d --name test [image_ID]
# docker exec -it test /bin/bash
