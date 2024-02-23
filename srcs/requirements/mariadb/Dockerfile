FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && \
	apt-get install -y mariadb-server && \
	mkdir -p /var/lib/mysql && \
	chown -R mysql:mysql /var/lib/mysql && \
	mysql_install_db --user=mysql --ldata=/var/lib/mysql

COPY conf/my.cnf /etc/mariadb.conf.d/server.conf
COPY tools/tool.sh /usr/local/bin/wp_db.sh

CMD ["mysqld_safe"]

WORKDIR /usr/local/bin
#RUN chmod +x ./wp_db.sh && ./wp_db.sh
#CMD ["sh", "-c", "/usr/bin/mysqld_safe && /home/db_init.sh"]
