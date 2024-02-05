FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y php-fpm php-cli php-mysqli wget curl

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod 700 wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/setup.sh /usr/local/bin/wp_setup.sh
RUN chmod 700 /usr/local/bin/wp_setup.sh

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY conf/phpinfo.php /var/www/html/

#WORKDIR /var/www/html/

EXPOSE 9000
ENTRYPOINT [ "/usr/local/bin/wp_setup.sh" ]
