FROM debian:buster-slim

RUN apt-get update \
    && apt-get install -y apt-utils \
    && apt-get upgrade -y \
    && apt-get update \
    && apt-get -y install vim \
    && apt-get -y install wget \
    && apt-get -y install openssl \
    && apt-get -y install nginx

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
# RUN rm /etc/nginx/sites-available/default
# RUN rm /etc/nginx/sites-enabled/default

# Add nginx config file
COPY ./requirements/nginx.conf /etc/nginx/
# RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

EXPOSE 443

# # nginx SSL
# RUN mkdir /etc/nginx/ssl
# RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=./O=42/CN=ldermign.42.fr" -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt

# # nginx config
# RUN mkdir -p /run/nginx
# COPY ./requirements/nginx.conf /etc/nginx/conf.d/default.conf

RUN service nginx start

ENTRYPOINT ["nginx", "-g", "daemon off;"]

# docker build -t nginx_test .
# docker images
# docker run -t -d --name test [image_ID]
# docker exec -it test /bin/bash
