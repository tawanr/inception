#!/bin/bash

while ! mariadb -h$WORDPRESS_DB_HOST -u$WORDPRESS_DB_USER -p$WORDPRESS_DB_PASS $WORDPRESS_DB_NAME; do
	sleep 3
done

chown -R www-data:www-data /var/www/*
chown -R 755 /var/www/*
mkdir -p /run/php/
touch /run/php/php7.3-fpm.pid
echo "Setting up Wordpress."

cd /tmp/
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
cd /var/www/html
wp core download --allow-root
wp config create --dbname=${WORDPRESS_DB_NAME} --dbhost=${WORDPRESS_DB_HOST} --dbuser=${WORDPRESS_DB_USER} --dbpass=${WORDPRESS_DB_PASS} --allow-root
echo "Created config at $(pwd)."
wp core install --url=${INCEPTION_URL} --title=${INCEPTION_TITLE} --admin_user=${WORDPRESS_USER} --admin_password=${WP_PASS} --admin_email=${WORDPRESS_EMAIL} --allow-root
wp theme install blocksy --activate --allow-root

service php7.3-fpm start
