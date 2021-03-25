FROM 	alpine:latest

RUN		apk add \
        vsftpd \
		openssl

RUN			mkdir -p /root/certs

COPY		srcs/key.pem /root/certs/

COPY		srcs/cert.pem /root/certs/

RUN			chown -R ftp:ftp /root/certs/*

COPY		srcs/ftps_setup.sh /

EXPOSE  20 21 10090-10100

CMD	  	sh ftps_setup.sh
