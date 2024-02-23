#!/bin/sh

if mysql -u "root" -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS ${WORDPRESS_DB_NAME}; \
  CREATE USER IF NOT EXISTS '${WORDPRESS_DB_USER}'@'localhost' IDENTIFIED BY '${WORDPRESS_DB_PWD}'; \
  GRANT ALL PRIVILEGES ON ${WORDPRESS_DB_NAME}.* TO '${WORDPRESS_DB_USER}'@'localhost'; \
  GRANT ALL PRIVILEGES ON wordpress.* TO '${WORDPRESS_DB_USER}'@'localhost'; \
  FLUSH PRIVILEGES;"; then
  echo "Todo un éxito."
else
  echo "Error al crear la base de datos o el usuario."
  exit 1
fi
