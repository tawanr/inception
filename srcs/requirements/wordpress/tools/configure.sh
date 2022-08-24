#!/bin/bash

while ! mariadb -h$WORDPRESS_DB_HOST -u$WORDPRESS_DB_USER -p$WORDPRESS_DB_PASS $WORDPRESS_DB_NAME; do
	sleep 3
done

mkdir -p /var/www/html/wordpress
chown -R www-data:www-data /var/www/*
mkdir -p /run/php/
touch /run/php/php7.3-fpm.pid
echo "Setting up Wordpress."

cd /tmp/
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
cd /var/www/html/wordpress
wp core download --allow-root
wp config create --dbname=${WORDPRESS_DB_NAME} --dbhost=${WORDPRESS_DB_HOST} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASS} --allow-root

echo "Created config at $(pwd)."
wp core install --url=${INCEPTION_URL}/wordpress --title=${INCEPTION_TITLE} --admin_user=${WORDPRESS_USER} --admin_password=${WORDPRESS_PASS} --admin_email=${WORDPRESS_EMAIL} --allow-root

sed -i "40i define( 'WP_REDIS_HOST', 'ft_redis' );"      wp-config.php
sed -i "41i define( 'WP_REDIS_PORT', 6379 );"               wp-config.php
sed -i "42i define( 'WP_REDIS_TIMEOUT', 1 );"               wp-config.php
sed -i "43i define( 'WP_REDIS_READ_TIMEOUT', 1 );"          wp-config.php
sed -i "44i define( 'WP_REDIS_DATABASE', 0 );\n"            wp-config.php

wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root
wp redis enable --allow-root

service php7.3-fpm start
tail -f /dev/null

