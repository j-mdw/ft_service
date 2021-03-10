FROM	alpine:latest

#NGINX installation

COPY	srcs/default.conf /etc/nginx/http.d/
#COPY	srcs/index.html /var/www/localhost/htdocs/

RUN	\	
		apk add\
		nginx\
		php7\
		php7-fpm\
		php7-opcache\
		php7-mysqli &&\
		mkdir -p /run/nginx

WORKDIR	/var/www/localhost/htdocs

ADD		https://wordpress.org/latest.tar.gz .

RUN		tar -xf latest.tar.gz && \
		rm latest.tar.gz

EXPOSE	5050

#CMD		nginx -g "daemon off";\
#		php-fpm7 start
