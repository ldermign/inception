FROM debian:buster-slim

RUN apt-get update \
    && apt-get install -y apt-utils \
    && apt-get install -y mariadb-client \
    && apt-get install -y mariadb-server 

RUN service mysql start

# RUN touch /var/run/mysqld/mysqld.sock
# RUN touch /var/run/mysqld/mysqld.pid
# RUN chown -R mysql:mysql /var/run/mysqld/mysqld.sock
# RUN chown -R mysql:mysql /var/run/mysqld/mysqld.pid
# RUN chmod -R 644 /var/run/mysqld/mysqld.sock

# RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

# RUN echo "FLUSH PRIVILEGES;"

# # # 
# # # RUN sudo userdel mysql
# # # RUN sudo useradd -u 999 mysql

# # # # 
# # RUN sudo mkdir -p /data/mysql
# # RUN sudo chown -R mysql:mysql /data/mysql

COPY ./requirements/start_mysql.sh /tmp/

EXPOSE 3306

CMD ["/bin/bash", "/tmp/start_mysql.sh"]