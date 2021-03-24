FROM 	alpine:latest

RUN		apk add \
        vsftpd \
        openrc

#RUN			rc-update add vsftpd default

#RUN		rc-service vsftpd restart

COPY		srcs/ftps_setup.sh /

RUN			mkdir -p /root/certs

COPY		srcs/key.pem /root/certs/

COPY		srcs/cert.pem /root/certs/

EXPOSE  20 21

CMD	  	sh ftps_setup.sh

#Test: nc -zv 127.0.0.1 21
