FROM	alpine:latest

EXPOSE	80

#NGINX installation

RUN		apk update && \
#		apk add openssl curl ca-certificates && \
#		printf "%s%s%s\n" \
#		"http://nginx.org/packages/alpine/v" \
#		`egrep -o '^[0-9]+\.[0-9]+' /etc/alpine-release` \
#		"/main" \
#		| tee -a /etc/apk/repositories && \
#		curl -o /tmp/nginx_signing.rsa.pub https://nginx.org/keys/nginx_signing.rsa.pub && \
#		openssl rsa -pubin -in /tmp/nginx_signing.rsa.pub -text -noout && \
#		mv /tmp/nginx_signing.rsa.pub /etc/apk/keys/ && \
		apk add nginx && \
		apk add php-fpm && \
		apk add php-mysqli && \
		mkdir -p /run/nginx

#Wordpress installation

#RUN

CMD		["nginx", "-g", "daemon off;"]
