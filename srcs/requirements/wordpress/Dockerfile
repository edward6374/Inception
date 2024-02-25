FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y php-fpm php-cli php-mysqli wget curl
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY tools/setup.sh /usr/local/bin/wp_setup.sh
COPY tools/start.sh /usr/local/bin/wp_start.sh
RUN chmod +x /usr/local/bin/wp_setup.sh && chmod +x /usr/local/bin/wp_start.sh

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY conf/phpinfo.php /var/www/html/

WORKDIR /var/www/wp/

#CMD [ "sh", "/usr/local/bin/wp_setup.sh" ]
CMD [ "tail", "-f", "/dev/null" ]

#ENTRYPOINT [ "/usr/local/bin/wp shell" ]
