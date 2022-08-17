FROM debian:buster

EXPOSE 9000

RUN apt update -y && apt upgrade -y && apt install -y \
		wget \
		tar \
		mariadb-client \
		php-fpm \
		php-mysql \
		php-curl \
		php-gd \
		php-intl \
		php-mbstring \
		php-soap \
		php-xml \
		php-xmlrpc \
		php-zip

COPY conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools /var/www

RUN chmod +x /var/www/configure.sh

ENTRYPOINT ["sh","/var/www/configure.sh"]
