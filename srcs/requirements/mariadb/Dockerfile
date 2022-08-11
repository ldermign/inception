FROM debian:buster-slim

RUN apt-get update \
    && apt-get install -y apt-utils \
    && apt-get install -y mariadb-server \
    && apt-get -y install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php7.3-mbstring

EXPOSE 3306