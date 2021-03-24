FROM	alpine:latest

#NGINX installation

COPY	srcs/default.conf /etc/nginx/http.d/
COPY	srcs/index.html /var/www/localhost/htdocs/

#ENV		IP=localhost
#ENV		PMAPORT=5000
#ENV		WPPORT=5050

RUN		mkdir -p /root/certs

COPY	srcs/cert.pem /root/certs
COPY	srcs/key.pem /root/certs

RUN	\	
		apk add nginx && \
		mkdir -p /run/nginx
		
EXPOSE	80 443

CMD		sed -i s/WPPORT/"${WPPORT}"/ /etc/nginx/http.d/default.conf && \ 
			sed -i s/PMAPORT/"${PMAPORT}"/ /etc/nginx/http.d/default.conf && \ 
			sed -i s/IP/"${IP}"/g /etc/nginx/http.d/default.conf && \
			nginx -g "daemon off;"
