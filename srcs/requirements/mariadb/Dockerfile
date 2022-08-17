FROM debian:buster-slim

RUN apt-get update \
    && apt-get install -y apt-utils \
    && apt-get install -y mariadb-server

RUN service mysql start

# Configure a wordpress database
RUN echo "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;" | mysql -u root
RUN echo "CREATE USER IF NOT EXISTS  \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';" | mysql -u root
RUN echo "GRANT ALL ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD} WITH GRANT OPTION;" | mysql -u root
# RUN echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
RUN echo "FLUSH PRIVILEGES;" | mysql -u root

# 
RUN sudo userdel mysql
RUN sudo useradd -u 999 mysql

# 
RUN sudo mkdir -p /data/mysql
RUN sudo chown -R mysql:mysql /data/mysql

EXPOSE 3306