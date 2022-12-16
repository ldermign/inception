#!/bin/sh

mysqld &
# Rediriger la sortie d'erreur

while !(mysqladmin ping > /dev/null)
    do
        sleep 2
    done

mysql -uroot -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -uroot -e "CREATE USER IF NOT EXISTS \`${MYSQL_ADMIN}\`@'localhost' IDENTIFIED BY '${MYSQL_ADMIN_PSWD}';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO \`${MYSQL_ADMIN}\`@'%' IDENTIFIED BY '${MYSQL_ADMIN_PSWD}' WITH GRANT OPTION;"
mysql -uroot -e "FLUSH PRIVILEGES;"

# mysql -uroot -e "CREATE DATABASE IF NOT EXISTS \`InfoMySql\`;"
# mysql -uroot -e "CREATE USER IF NOT EXISTS \`ldermign\`@'localhost' IDENTIFIED BY 'InceptionVM42';"
# mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO \`ldermign\`@'%' IDENTIFIED BY 'InceptionVM42' WITH GRANT OPTION;"
# mysql -uroot -e "FLUSH PRIVILEGES;"

mysqladmin -u root shutdown

sleep 10
# maybe an other while

mysqld
