FROM	alpine:latest

#NGINX installation

COPY	srcs/default.conf /etc/nginx/http.d/
#COPY	srcs/index.html /var/www/localhost/htdocs/

RUN	\	
		apk add\
		nginx\
#		php7\
#		php7-fpm\
#		php7-opcache\
#		php7-mysqli &&\
		php-fpm\
		php-mysqli &&\
		mkdir -p /run/nginx

WORKDIR	/var/www/localhost/htdocs

ADD		https://wordpress.org/latest.tar.gz .

RUN		tar -xf latest.tar.gz && \
			rm latest.tar.gz &&\
			ls &&\
			chmod -R 777 wordpress

EXPOSE	5050

CMD		["/bin/sh", "-c", "/usr/sbin/php-fpm7; exec nginx -g 'daemon off;';"]
