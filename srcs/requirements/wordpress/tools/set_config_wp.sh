sleep 20

wp core download --path='/var/www/wordpress' --allow-root

# mv /tmp/wp-config.php ./wp-config.php
# wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_USER_PSWD --dbhost=mariadb:3306 --path='/var/www/wordpress' --skip-check

# wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install --allow-root --url=${DOMAIN_NAME} --title=$TITLE --admin_user=$MYSQL_ADMIN --admin_password=$MYSQL_ADMIN_PSWD --admin_email=$EMAIL

# peut etre pas car deja dans la base de donnee mariadb
# wp user create --allow-root $MYSQL_USER ${EMAIL} --user_pass=${MYSQL_USER_PSWD} --path='/var/www/wordpress'
# --allow-root ??

mkdir -p /run/php

# comme le script est sur le pid 1, c'est pour le remttre dessus a la fin avec le exec
# lancement de php-fpm pour wordpress: maj des fichiers de wp en .php
# on l'utilise pour les pages web dynamiques
exec /usr/sbin/php-fpm7.3 -F