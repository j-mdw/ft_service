FROM		alpine:latest

RUN			apk add \
			telegraf

COPY		srcs/telegraf_setup.sh /

CMD			sh telegraf_setup.sh
