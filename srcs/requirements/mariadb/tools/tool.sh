#!/bin/sh


if mysql -u "root" -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DTB}; \
  CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PWD}'; \
  GRANT ALL PRIVILEGES ON ${MYSQL_DTB}.* TO '${MYSQL_USER}'@'localhost'; \
  GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@'localhost'; \
  GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'wp.srcs_net' IDENTIFIED BY '${MYSQL_PWD}' WITH GRANT OPTION; \
  GRANT ALL PRIVILEGES ON ${MYSQL_DTB}.* TO '${MYSQL_USER}'@'wp.srcs_net' IDENTIFIED BY '${MYSQL_PWD}'; \
  FLUSH PRIVILEGES;"; then
  echo "Todo un éxito."
else
  echo "Error al crear la base de datos o el usuario."
  exit 1
fi
