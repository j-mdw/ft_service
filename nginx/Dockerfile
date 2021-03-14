FROM	alpine:latest

#NGINX installation

COPY	srcs/default.conf /etc/nginx/http.d/
COPY	srcs/index.html /var/www/localhost/htdocs/

#ENV		IP=localhost
#ENV		PMAPORT=5000
#ENV		WPPORT=5050

RUN		mkdir /root/certs

COPY	srcs/cert.pem /root/certs
COPY	srcs/key.pem /root/certs

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

CMD		sed -i s/WPPORT/"${WPPORT}"/ /etc/nginx/http.d/default.conf && \ 
			sed -i s/PMAPORT/"${PMAPORT}"/ /etc/nginx/http.d/default.conf && \ 
			sed -i s/IP/"${IP}"/g /etc/nginx/http.d/default.conf && \
			nginx -g "daemon off;"
