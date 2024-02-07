FROM	debian:buster

RUN		apt update -y
RUN		apt upgrade -y
RUN		apt install -y php7.3\
						php-fpm\
						php-mysql\
						mariadb-client\
						wget

RUN		wget https://fr.wordpress.org/wordpress-6.4.3-fr_FR.tar.gz -P /var/www
RUN		cd /var/www && tar -xzf wordpress-6.4.3-fr_FR.tar.gz && rm wordpress-6.4.3-fr_FR.tar.gz
RUN		chown -R root:root /var/www/wordpress

COPY	./config/php.ini /etc/php/7.3/php.ini
COPY	./tools/run.sh /tmp/run.sh

ENTRYPOINT [ "sh", "/tmp/run.sh" ]