#!/bin/sh

env

mkdir -p /var/www/wordpress
chown -R www-data /var/www/wordpress

openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=${DOMAIN_NAME}/UID=${SQL_USER}"

sed -i 's|DOMAIN_NAME|'${DOMAIN_NAME}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|WP_PATH|'/var/www/wordpress'|g' /etc/nginx/sites-available/default.conf
sed -i 's|PHP_HOST|'${PHP_HOST}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|PHP_PORT|'${PHP_PORT}'|g' /etc/nginx/sites-available/default.conf

nginx -g "daemon off;"