FROM debian:buster-slim

RUN apt-get update \
    && apt-get install -y apt-utils \
    && apt-get install -y mariadb-client \
    && apt-get install -y mariadb-server 
#     && apt-get install -y mysql-server

RUN service mysql start
# RUN /etc/init.d/mysql start

# RUN touch /var/run/mysqld/mysqld.sock
# RUN touch /var/run/mysqld/mysqld.pid
# RUN chown -R mysql:mysql /var/run/mysqld/mysqld.sock
# RUN chown -R mysql:mysql /var/run/mysqld/mysqld.pid
# RUN chmod -R 644 /var/run/mysqld/mysqld.sock

# RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

# RUN service mysql restart

# RUN mv 
# RUN mysql -u root

# # Configure a wordpress database
# RUN echo "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;" | mysql -u root
# RUN echo "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
# RUN echo "GRANT ALL ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD} WITH GRANT OPTION;"

# # # RUN echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

# RUN echo "FLUSH PRIVILEGES;"

# # # 
# # # RUN sudo userdel mysql
# # # RUN sudo useradd -u 999 mysql

# # # # 
# # RUN sudo mkdir -p /data/mysql
# # RUN sudo chown -R mysql:mysql /data/mysql

COPY ./requirements/start_mysql.sh /tmp/

EXPOSE 3306

CMD bash /tmp/start_mysql.sh