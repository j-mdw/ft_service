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
		php-session\
		php-mbstring\
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
