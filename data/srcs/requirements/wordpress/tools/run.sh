#!/bin/sh

sleep 10

sed -i 's|PHP_PORT|'${PHP_PORT}'|g' /etc/php/7.3/fpm/pool.d/www.conf

if [ -f "/var/www/html/wordpress/wp-config.php" ]

then
	echo "Wordpress already confiured."

else
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp core download --path=/var/www/wordpress --allow-root
	wp config create --dbname=$SQL_DATABASE \
  					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD \
					--dbhost=mariadb \
					--path=/var/www/wordpress \
					--skip-check \
					--allow-root

	wp core install --path=/var/www/wordpress \
  					--url=$DOMAIN_NAME \
					--title=$WP_TITLE \
					--admin_user=$WP_USER \
					--admin_password=$WP_PASSWORD \
					--admin_email=$WP_EMAIL \
					--skip-email \
					--allow-root
	
	wp theme install teluro --path=/var/www/wordpress --activate --allow-root
	wp user create jauffret jauffret@jauffret.42 --role=author --path=/var/www/wordpress --user_pass=jauffret --allow-root

fi

/usr/sbin/php-fpm7.3 -F
