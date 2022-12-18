FROM debian:buster-slim

# EXPOSE 3306

RUN apt-get update -y \
	&& apt-get upgrade -y \
    && apt-get install -y apt-utils \
    && apt-get install -y mariadb-client \
    && apt-get install -y mariadb-server \
    procps

# RUN service mysql start

# RUN rm -rf /var/run/mysql
RUN mkdir -p /var/run/mysql
RUN chmod 755 -R /var/run/mysql

# RUN rm etc/mysql/mariadb.conf.d/my.cnf
COPY ./conf/50-server.cnf etc/mysql/mariadb.conf.d/50-server.cnf
# COPY ./conf/50-server.cnf /var/run/mysql/

COPY ./conf/start_mysql.sh /tmp/
RUN chmod 777 /tmp/start_mysql.sh

RUN service mysql start

# RUN service mysql start && mysql < /tmp/start_mysql.sql

CMD ["bash", "/tmp/start_mysql.sh"]