mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

chown -R mysql:mysql /var/lib/mysql
echo "Setting up permissions for MariaDB."

mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql &> /dev/null

echo "[mysqld]" >> /etc/mysql/my.cnf
echo "skip-grant-tables" >> /etc/mysql/my.cnf
mysqld -umysql --initialize-insecure
service mysql start --silent-startup

echo "Configuring MariaDB."
sed -i "s/\$SQL_ROOT_PASS/$SQL_ROOT_PASS/g" /var/www/configure.sql
sed -i "s/\$WORDPRESS_DB_NAME/$WORDPRESS_DB_NAME/g" /var/www/configure.sql
sed -i "s/\$WORDPRESS_DB_PASS/$WORDPRESS_DB_PASS/g" /var/www/configure.sql
sed -i "s/\$WORDPRESS_DB_USER/$WORDPRESS_DB_USER/g" /var/www/configure.sql
mysql -umysql < /var/www/configure.sql
sed -i "s/skip-networking/# skip-networking/g" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s/.*bind-address\s*=.*/bind-address=0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
service mysql stop

mysqld -u mysql