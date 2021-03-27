FROM			alpine:3.13

RUN				apk add \
				influxdb

COPY			srcs/influx_init.sh /

EXPOSE			8086 8088

CMD				sh influx_init.sh
