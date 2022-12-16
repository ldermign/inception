sleep 10

wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_USER_PSWD --dbhost=mariadb:3306 --path=/var/www/wordpress
wp core install --allow-root --url=$DOMAIN_NAME --title=$TITLE --admin_user=$MYSQL_ADMIN --admin_password=$MYSQL_ADMIN_PSWD --admin_email=$EMAIL --path=/var/www/wordpress
wp user create --allow-root $MYSQL_USER --role=administrator

# wp config create	--allow-root \
# 	--dbname=$MYSQL_DATABASE \
#     --dbuser=$MYSQL_USER \
# 	--dbpass=$MYSQL_PASSWORD \
# 	--dbhost=mariadb:3306 --path='/var/www/wordpress'
# wp core install --url=$DOMAIN_NAME --title=$TITLE --admin_user=$MYSQL_ADMIN --admin_password=$MYSQL_ADMIN_PSWD --admin_email=$EMAIL --path=/var/www/wordpress --allow-root --skip-email;

mkdir -p /run/php

/usr/sbin/php-fpm7.3 -F