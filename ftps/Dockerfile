FROM 	alpine:latest

RUN		apk add \
        vsftpd \
        openrc

RUN		rc-update add vsftpd default

RUN		rc-service vsftpd restart

EXPOSE  21

CMD		rc-service vsftpd start

#Test: nc -zv 127.0.0.1 21
