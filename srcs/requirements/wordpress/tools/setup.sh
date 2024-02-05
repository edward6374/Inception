#!bin/bash

echo "WP User: -$WORDPRESS_DB_NAME-"
echo "WP Database: -$WORDPRESS_DB_HOST-"
if [ ! -f "/var/www/html/config.php" ]; then
	cd /var/www/html
	wp core download --allow-root
	echo ""
	echo "WP DOWNLOADED"
	echo ""
	echo "Host: -$WORDPRESS_DB_HOST-"
	echo "Name: -$WORDPRESS_DB_NAME-"
	echo "User: -$WORDPRESS_DB_USER-"
	echo "Password: -$WORDPRESS_DB_PWD-"
	echo "Domain name: -$DOMAIN_NAME-"
	echo "Title: -$TITLE-"
	echo "Admin user: -$ADMIN_WP_USER-"
	echo "Admin password: -$ADMIN_WP_PWD-"
	echo "Admin email: -$ADMIN_WP_EMAIL-"
	echo "Normal user: -$WP_NORMAL_USER-"
	echo "Normal mail: -$WP_NORMAL_EMAIL-"
	echo "Normal password: -$WP_NORMAL_PWD-"
	wp config create --dbhost=$WORDPRESS_DB_HOST --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PWD --dbcharset="utf8" --allow-root
	echo ""
	echo "WP CONFIG CREATED"
	echo ""
	#wp core install --url=$DOMAIN_NAME --title=$TITLE --admin_user=$ADMIN_WP_USER --admin_password=$ADMIN_WP_PWD --admin_email=$ADMIN_WP_EMAIL --allow-root
	#echo ""
	#echo "WP CORE INSTALLED"
	#echo ""
	#wp user create $WP_NORMAL_USER $WP_NORMAL_EMAIL --role=author --user_pass=$WP_NORMAL_PWD --allow-root
	#echo ""
	#echo "WP USER CREATED"
	#echo ""
fi

echo "Wordpress is set up! Now running"
#/usr/sbin/php-fpm7.4 -F
