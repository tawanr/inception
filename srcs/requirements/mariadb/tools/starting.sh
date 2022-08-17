mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

chown -R mysql:mysql /var/lib/mysql
echo "Setting up permissions for MariaDB."

#service mysql stop

mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql

echo "[mysqld]" > /etc/mysql/my.cnf
service mysql start
#mysql < /var/www/configure.sql
#service mysql restart

#cat /var/www/configure.sql
mysql -u mysql < /var/www/configure.sql
sed -i "s|skip-networking|# skip-networking|g" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf
#cp /etc/mysql/mariadb.conf.d/50-server.cnf.temp /etc/mysql/mariadb.conf.d/50-server.cnf
#service mysql stop
#mysqld

exec /usr/bin/mysqld_safe --user=mysql --console
