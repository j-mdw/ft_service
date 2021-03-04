FROM	alpine:latest


#NGINX installation

COPY	srcs/default.conf /etc/nginx/http.d/
COPY	srcs/index.html /var/www/localhost/htdocs/
COPY	srcs/cert.pem /etc/nginx
COPY	srcs/key.pem /etc/nginx

RUN	\	
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
		mkdir -p /run/nginx
		
EXPOSE	80 443

CMD		["nginx", "-g", "daemon off;"]
