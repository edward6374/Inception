FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y mariadb-server

COPY conf/default.cnf /etc/mysql/my.cnf
COPY conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/tool.sh /usr/local/bin/wp_db.sh

WORKDIR /usr/local/bin

CMD ["mysqld_safe"]
