FROM		alpine:latest

RUN			apk add influxdb

#RUN			mkdir -p /var/lib/influxdb

#RUN			adduser influxdb

#RUN			chown -R influxdb:influxdb /var/lib/influxdb

EXPOSE		8086 8088

CMD			influxd

# Need to enable http and bind-address
