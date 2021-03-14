FROM	alpine:latest

#NGINX installation

COPY	srcs/default.conf /etc/nginx/http.d/

RUN		mkdir /root/certs

COPY	srcs/cert.pem /root/certs
COPY	srcs/key.pem /root/certs

RUN	\
		apk add\
		nginx\
		php\
		php-opcache\
		php-fpm\
		php-json\
		php-mbstring\
		php-xml\
		php-iconv\
		php-session\
		php-mysqli &&\
		mkdir -p /run/nginx

WORKDIR	/var/www/localhost/htdocs

ADD		https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.gz .

RUN		tar -xf phpMyAdmin-latest-english.tar.gz &&\
			rm phpMyAdmin-latest-english.tar.gz &&\
			mv php* phpmyadmin &&\
			chmod -R 777 phpmyadmin 

EXPOSE	5000

CMD		["/bin/sh", "-c", "/usr/sbin/php-fpm7; exec nginx -g 'daemon off;';"]
