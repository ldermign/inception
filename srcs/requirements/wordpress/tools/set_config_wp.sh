sleep 10

wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_USER_PSWD --dbhost=mariadb:3306 --path='/var/www/wordpress'
wp core install --url=$DOMAIN_NAME --title="Ldermign 42" --admin_user="ldermign" --admin_password="motdepasse_administrateur" --admin_email="ldermign@student.42.fr"
wp user create dishdls

/usr/sbin/php-fpm7.3 -F