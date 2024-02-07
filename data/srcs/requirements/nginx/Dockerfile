
FROM	debian:buster

RUN		apt update -y
RUN		apt upgrade -y
RUN		apt install -y nginx
RUN		apt install -y openssl
RUN		chown -R www-data /var/lib/nginx
RUN		rm -rf /etc/nginx/sites-available/default
RUN		mkdir -p /etc/nginx/ssl
RUN		mkdir -p /run/nginx

COPY	./conf/default.conf /etc/nginx/sites-available/default.conf
COPY	./conf/nginx.conf /etc/nginx/nginx.conf
COPY	./tools/run.sh /tmp/run.sh

RUN		ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

EXPOSE	443

ENTRYPOINT [ "sh", "/tmp/run.sh" ]
