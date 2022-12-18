#!/bin/sh

mysqld_safe > /dev/null 2>&1 &
# Rediriger la sortie d'erreur

while !(mysqladmin ping > /dev/null 2>&1 ) do
    sleep 2
done

mysql -uroot -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -uroot -e "CREATE USER IF NOT EXISTS \`${MYSQL_ADMIN}\`@'%' IDENTIFIED BY '${MYSQL_ADMIN_PSWD}';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO \`${MYSQL_ADMIN}\`@'%' IDENTIFIED BY '${MYSQL_ADMIN_PSWD}' WITH GRANT OPTION;"
mysql -uroot -e "FLUSH PRIVILEGES;"

#peut etre pas
mysql -uroot -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_USER_PSWD}';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO \`${MYSQL_USER}\`;"

mysql -uroot -e "FLUSH PRIVILEGES;"
# supprimer tous les rrot en localhost 127.0.0.1
# obliger mdp local en root

# mysql -uroot -e "CREATE DATABASE IF NOT EXISTS \`InfoMySql\`;"
# mysql -uroot -e "CREATE USER IF NOT EXISTS \`ldermign\`@'localhost' IDENTIFIED BY 'InceptionVM42';"
# mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO \`ldermign\`@'%' IDENTIFIED BY 'InceptionVM42' WITH GRANT OPTION;"
# mysql -uroot -e "FLUSH PRIVILEGES;"

mysqladmin -u root shutdown

sleep 10
# maybe an other while

# exec pour mettre mysqld sur pid 1
exec mysqld_safe
