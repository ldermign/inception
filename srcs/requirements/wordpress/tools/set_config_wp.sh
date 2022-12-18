sleep 10

# test
wp core download --allow-root --path="/var/www/wordpress"

# wp config create --allow-root --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_USER_PSWD --dbhost=mariadb:3306 --path=${WP_PATH}

# cd /var/www/wordpress

wp core install --allow-root --url=${DOMAIN_NAME} --title=$TITLE --admin_user=$MYSQL_ADMIN --admin_password=$MYSQL_ADMIN_PSWD --admin_email=$EMAIL


# peut etre pas car deja dans la base de donnee mariadb
# wp user create $MYSQL_ADMIN --user_pass=${MYSQL_ADMIN_PWD} --path=$WP_PATH
# --allow-root ??

# wp user create --allow-root $MYSQL_USER --role=administrator
# wp user create --allow-root $MYSQL_USER --role=administrator

mkdir -p /run/php

# comme le script est sur le pid 1, c'est pour le remttre dessus a la fin
exec /usr/sbin/php-fpm7.3 -F