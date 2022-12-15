mysqld &
# Rediriger la sortie d'erreur

sleep 10
# wait until mysqld is laucned

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_ADMIN}\`@'localhost' IDENTIFIED BY '${MYSQL_ADMIN_PSWD}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO \`${MYSQL_ADMIN}\`@'%' IDENTIFIED BY '${MYSQL_ADMIN_PSWD}' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"


mysqladmin -u root shutdown

sleep 10
# maybe a other while

mysqld
