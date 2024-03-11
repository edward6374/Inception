#!bin/bash

if [ -f ./wp-config.php ]
then
	echo "Wordpress already exists"
else
	wp core download --allow-root
	wp config create --dbname=$MYSQL_DTB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PWD --dbhost=$MYSQL_HOSTNAME --allow-root
	wp core install --url=$DOMAIN_NAME --title="$WORDPRESS_TITLE" --admin_user=$ADMIM_WP_USER --admin_password=$ADMIN_WP_PWD  --admin_email=$ADMIN_WP_EMAIL --skip-email --allow-root
	wp user create $WP_NORMAL_USER $WP_NORMAL_EMAIL --user_pass=$WP_NORMAL_PWD --role=author --allow-root
	wp theme install twentysixteen --activate --allow-root
fi

echo "Wordpress is set up! Now running"
/usr/sbin/php-fpm7.4 -F
