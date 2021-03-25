FROM	alpine:latest

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
		php-mysqli \
		php-phar \
		curl &&\
		mkdir -p /run/nginx

WORKDIR	/var/www/localhost/htdocs

ADD		https://wordpress.org/latest.tar.gz .

RUN		tar -xf latest.tar.gz && \
		rm latest.tar.gz &&\
		ls &&\
		chmod -R 777 wordpress

WORKDIR	/var/www/localhost/htdocs/wordpress

RUN		mv wp-config-sample.php wp-config.php

RUN		sed -i "s/database_name_here/wordpress/" wp-config.php

RUN		sed -i "s/username_here/user1/" wp-config.php

RUN		sed -i "s/password_here/user1/" wp-config.php

RUN		sed -i "s/localhost/mysql-service/" wp-config.php

#wp-cli install
RUN		apk add php-phar curl
RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp

COPY	srcs/wp_setup.sh .

EXPOSE	5050

CMD		sh wp_setup.sh
