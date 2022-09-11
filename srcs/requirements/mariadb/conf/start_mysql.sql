-- # service mysql start
-- # mysql -u root
-- # echo "exit;"

-- ~~~~~ WITH DOCKER-COMPOSE ~~~~~ #
-- new database
echo "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`; | mysql -e"
-- create admin user
echo "CREATE USER IF NOT EXISTS \`${MYSQL_ADMIN}\`@'localhost' IDENTIFIED BY '${MYSQL_ADMIN_PSWD}'; | mysql -e"
-- grant full access to database for admin
echo "GRANT ALL PRIVILEGES ON *.* TO \`${MYSQL_ADMIN}\`@'%' IDENTIFIED BY '${MYSQL_ADMIN_PSWD} WITH GRANT OPTION; | mysql -e"
-- reload changes
echo "FLUSH PRIVILEGES;"

-- restart mysql
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe

-- -- # ~~~~~ WITHOUT DOCKER-COMPOSE ~~~~~ #
-- -- # new database
-- CREATE DATABASE IF NOT EXISTS InfoMySql;
-- --  | mysql -u root
-- -- # create admin user
-- CREATE USER IF NOT EXISTS 'ldermign'@'localhost' IDENTIFIED BY 'InceptionVM42';
-- --  | mysql -u root
-- -- # grant full access to database for admin
-- GRANT ALL PRIVILEGES ON *.* TO 'ldermign'@'%' IDENTIFIED BY 'InceptionVM42' WITH GRANT OPTION;
-- --  | mysql -u root
-- -- # reload changes
-- FLUSH PRIVILEGES;
-- --  | mysql -u root


-- # echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"


-- # create user


