sleep 10

wp core download --path='/var/www/wordpress' --allow-root

# wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_USER_PSWD --dbhost=mariadb:3306 --path="/var/www/wordpress" --skip-ckeck

wp core install --allow-root --url=${DOMAIN_NAME} --title=$TITLE --admin_user=$MYSQL_ADMIN --admin_password=$MYSQL_ADMIN_PSWD --admin_email=$EMAIL

# peut etre pas car deja dans la base de donnee mariadb
# wp user create $MYSQL_USER --role=author --user_pass=${MYSQL_USER_PSWD}
# --allow-root ??

mkdir -p /run/php

# comme le script est sur le pid 1, c'est pour le remttre dessus a la fin
exec /usr/sbin/php-fpm7.3 -F