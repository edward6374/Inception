FROM debian::bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server

#CMD ["mysqld_safe"]

COPY conf/my.cnf /etc/mariadb.conf.d/server.conf
COPY tools/tool.sh /usr/local/bin/wp_db.sh

WORKDIR /usr/local/bin
RUN chmod +x ./wp_db.sh && ./wp_db.sh
CMD ["sh", "-c", "/usr/bin/mysqld_safe && /home/db_init.sh"]
