FROM debian:buster-slim

RUN apt-get update -y \
	&& apt-get upgrade -y \
    && apt-get install -y apt-utils \
    && apt-get install -y mariadb-client \
    && apt-get install -y mariadb-server 

RUN service mysql start

RUN rm etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/my.cnf etc/mysql/mariadb.conf.d/

COPY ./conf/start_mysql.sql /tmp/

# RUN service mysql start && mysql < /tmp/start_mysql.sql

EXPOSE 3306

CMD ["bash", "/tmp/start_mysql.sql"]