service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS 'ldermign'@'localhost' IDENTIFIED BY 'InceptionVM42';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'ldermign'@'%' IDENTIFIED BY 'InceptionVM42' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe
