FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y mariadb-server 

EXPOSE 3306

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf.temp
COPY tools/configure.sql /var/www/
COPY tools/starting.sh /var/www/

CMD ["sh","/var/www/starting.sh"]