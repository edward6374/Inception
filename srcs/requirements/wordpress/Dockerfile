FROM debian:bullseye

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y php-fpm \
		php-cli \
		php-mysqli \
		wget \
		curl \
		vim

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp-cli.phar

COPY tools/setup.sh /usr/local/bin/setup_wp
COPY tools/start.sh /usr/local/bin/start_wp

RUN mkdir /run/php \
	&& chmod 777 /run/php
RUN chmod +x /usr/local/bin/setup_wp \
	&& chmod +x /usr/local/bin/start_wp

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY conf/phpinfo.php /var/www/html/

WORKDIR /var/www/wp/

CMD [ "start_wp" ]
