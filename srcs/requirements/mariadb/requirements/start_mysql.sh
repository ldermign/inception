mysql -u root

# new database
echo "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;" | mysql -u root

# create admin user
echo "CREATE USER IF NOT EXISTS \`${MYSQL_ADMIN}\`@'localhost' IDENTIFIED BY '${MYSQL_ADMIN_PSWD}';"

# grant full access to database for admin
echo "GRANT ALL PRIVILEGES ON *.* TO \`${MYSQL_ADMIN}\`@'%' IDENTIFIED BY '${MYSQL_ADMIN_PSWD} WITH GRANT OPTION;"

# reload changes
echo "FLUSH PRIVILEGES;"

# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"


# create user
