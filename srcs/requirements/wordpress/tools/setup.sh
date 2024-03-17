#!bin/bash
WP_EXEC=/usr/local/bin/wp-cli.phar

if [ -f /var/www/wp/wp-config.php ]
then
	echo "Wordpress already exists"
else
	cd /var/www/wp
	$WP_EXEC core download --allow-root
	$WP_EXEC config create --dbname=$MYSQL_DTB --dbuser=$MYSQL_USER --dbpass=$MYSQL_PWD --dbhost=$MYSQL_HOSTNAME --allow-root
	$WP_EXEC core install --url=$DOMAIN_NAME --title="$WORDPRESS_TITLE" --admin_user=$ADMIN_WP_USER --admin_password=$ADMIN_WP_PWD  --admin_email=$ADMIN_WP_EMAIL --skip-email --allow-root
	$WP_EXEC user create $WP_NORMAL_USER $WP_NORMAL_EMAIL --user_pass=$WP_NORMAL_PWD --role=author --allow-root
	$WP_EXEC theme install twentysixteen --activate --allow-root
fi

echo "Wordpress is set up!"
#/usr/sbin/php-fpm7.4 -F
