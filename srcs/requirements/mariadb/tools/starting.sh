if [ ! -d /run/mysqld ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld

	chown -R mysql:mysql /var/lib/mysql
	echo "Setting up permissions for MariaDB."
fi

if [ ! -f /etc/mysql/my.cnf.bak ]; then
	cp /etc/mysql/my.cnf /etc/mysql/my.cnf.bak
	echo "[mysqld]" >> /etc/mysql/my.cnf
	echo "skip-grant-tables" >> /etc/mysql/my.cnf
	mysqld -u root --initialize-insecure
	service mysql start

	echo "Configuring MariaDB." 
	sed -i "s/\$SQL_ROOT_PASS/$SQL_ROOT_PASS/g" /var/www/configure.sql
	sed -i "s/\$WORDPRESS_DB_NAME/$WORDPRESS_DB_NAME/g" /var/www/configure.sql
	sed -i "s/\$WORDPRESS_DB_PASS/$WORDPRESS_DB_PASS/g" /var/www/configure.sql
	sed -i "s/\$WORDPRESS_DB_USER/$WORDPRESS_DB_USER/g" /var/www/configure.sql
	mysql -f < /var/www/configure.sql
	service mysql stop
fi
echo "MariaDB is running..."
mysqld -u mysql