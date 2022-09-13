FROM debian:buster-slim

EXPOSE 443

RUN apt-get update \
    && apt-get install -y apt-utils \
    && apt-get upgrade -y \
    && apt-get update \
    && apt-get -y install vim -y \
    && apt-get -y install wget \
    && apt-get -y install openssl -y \
    && apt-get -y install nginx -y

RUN mkdir -p /etc/nginx/ssl
RUN chmod 755 -R /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=./O=42/CN=ldermign.42.fr" -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt

# RUN rm /var/www/html/index.nginx-debian.html
RUN mkdir -p /var/run/nginx
RUN rm -v /etc/nginx/nginx.conf
COPY ./conf/nginx.conf /etc/nginx/
COPY ./conf/info.php /var/www/html/


# RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN chmod 755 -R /var/www/html
RUN chown -R www-data:www-data /var/www/html

	# # nginx SSL
	# RUN mkdir /etc/nginx/ssl
	# RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=./O=42/CN=ldermign.42.fr" -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt

	# # nginx config
	# RUN mkdir -p /run/nginx
	# COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

# RUN service nginx start

CMD ["nginx", "-g", "daemon off;"]

# docker build -t nginx_test .
# docker images
# docker run -t -d --name test [image_ID]
# docker exec -it test /bin/bash
