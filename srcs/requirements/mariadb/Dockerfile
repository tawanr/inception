FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y mariadb-server 

EXPOSE 3306

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf.temp
COPY tools/configure.sql /var/www/
COPY tools/starting.sh /var/www/

#ENTRYPOINT ["sh","/var/www/starting.sh"]
RUN ["sh","/var/www/starting.sh"]

#RUN service mysql start && mysql < /var/www/configure.sql && rm -f /var/www/configure.sql
#RUN service mysql start

#CMD ["mysqld"]
CMD ["tail","-f","/dev/null"]
